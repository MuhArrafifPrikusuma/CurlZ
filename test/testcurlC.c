#include <curl/curl.h>
#include <curl/curlver.h>
#include <curl/easy.h>
#include <curl/multi.h>
#include <curl/typecheck-gcc.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void) {
  CURL *curl = curl_easy_init();
  if (curl) {
    char *output = curl_easy_escape(curl, "data to convert", 15);
    if (output) {
      printf("encoded: %s\n", output);
      curl_free(output);
    }
    curl_easy_cleanup(curl);
  }
}
