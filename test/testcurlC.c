#include <curl/curl.h>
#include <curl/easy.h>
#include <curl/multi.h>
#include <curl/typecheck-gcc.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
  if (curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
    fprintf(stderr, "failed to initiate curl with code\n");
    _exit(1);
  };
  CURLM *multi = curl_multi_init();
  CURL *easy[100];
  for (int i = 0; i < 100; i++) {
    easy[i] = curl_easy_init();
    CURLcode code =
        curl_easy_setopt(easy[i], CURLOPT_URL, "http://localhost:8080/");
    if (code != CURLE_OK) {
      fprintf(stderr, "curl_easy_setopt() failed code, %d.\n", (int)code);
    }
    code = curl_easy_setopt(easy[i], CURLOPT_HTTPGET, (long)1);
    if (code != CURLE_OK) {
      fprintf(stderr, "curl_easy_setopt() failed code, %d.\n", (int)code);
    }
    if (easy[i] && code == CURLE_OK) {
      curl_multi_add_handle(multi, easy[i]);
    }
  }

  int still_running = 1;

  while (true) {
    CURLMcode mresult = curl_multi_perform(multi, &still_running);
    if (mresult != CURLM_OK) {
      fprintf(stderr, "curl_multi_perform() failed code %d.\n", (int)mresult);
    }
    if (!still_running) {
      break;
    }
  }
  curl_multi_remove_handle(multi, easy);
  curl_easy_cleanup(easy);
  curl_multi_cleanup(multi);
  curl_global_cleanup();
  return EXIT_SUCCESS;
}
