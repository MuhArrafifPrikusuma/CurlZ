const __root = @This();
pub const __builtin = @import("std").zig.c_translation.builtins;
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __aro_max_align_ll: c_longlong = 0,
    __aro_max_align_ld: c_longdouble = 0,
};
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_int;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.c) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @byteSwap(@as(__uint16_t, __bsx));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.c) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @bitCast(@as(c_int, @byteSwap(@as(c_int, @bitCast(@as(c_uint, @truncate(__bsx)))))));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.c) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @bitCast(@as(c_long, @byteSwap(@as(c_long, @bitCast(@as(c_ulong, @truncate(__bsx)))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.c) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.c) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.c) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
    pub const gettimeofday = __root.gettimeofday;
    pub const settimeofday = __root.settimeofday;
    pub const adjtime = __root.adjtime;
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
    pub const nanosleep = __root.nanosleep;
    pub const timespec_get = __root.timespec_get;
    pub const get = __root.timespec_get;
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint = 0,
    __high: c_uint = 0,
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = null,
    __next: [*c]struct___pthread_internal_list = null,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = null,
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = 0,
    __count: c_uint = 0,
    __owner: c_int = 0,
    __nusers: c_uint = 0,
    __kind: c_int = 0,
    __spins: c_short = 0,
    __glibc_reserved: c_short = 0,
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = 0,
    __writers: c_uint = 0,
    __wrphase_futex: c_uint = 0,
    __writers_futex: c_uint = 0,
    __pad3: c_uint = 0,
    __pad4: c_uint = 0,
    __cur_writer: c_int = 0,
    __shared: c_int = 0,
    __pad1: c_ulong = 0,
    __pad2: c_ulong = 0,
    __flags: c_uint = 0,
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = 0,
    __wrefs: c_uint = 0,
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __unused_initialized_1: c_uint = 0,
    __unused_initialized_2: c_uint = 0,
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = 0,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = null,
    iov_len: usize = 0,
};
pub const socklen_t = __socklen_t;
pub const SOCK_STREAM: c_int = 1;
pub const SOCK_DGRAM: c_int = 2;
pub const SOCK_RAW: c_int = 3;
pub const SOCK_RDM: c_int = 4;
pub const SOCK_SEQPACKET: c_int = 5;
pub const SOCK_DCCP: c_int = 6;
pub const SOCK_PACKET: c_int = 10;
pub const SOCK_CLOEXEC: c_int = 524288;
pub const SOCK_NONBLOCK: c_int = 2048;
pub const enum___socket_type = c_uint;
pub const sa_family_t = c_ushort;
pub const struct_sockaddr = extern struct {
    sa_family: sa_family_t = 0,
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sockaddr_storage = extern struct {
    ss_family: sa_family_t = 0,
    __ss_padding: [118]u8 = @import("std").mem.zeroes([118]u8),
    __ss_align: c_ulong = 0,
};
pub const MSG_OOB: c_int = 1;
pub const MSG_PEEK: c_int = 2;
pub const MSG_DONTROUTE: c_int = 4;
pub const MSG_CTRUNC: c_int = 8;
pub const MSG_PROXY: c_int = 16;
pub const MSG_TRUNC: c_int = 32;
pub const MSG_DONTWAIT: c_int = 64;
pub const MSG_EOR: c_int = 128;
pub const MSG_WAITALL: c_int = 256;
pub const MSG_FIN: c_int = 512;
pub const MSG_SYN: c_int = 1024;
pub const MSG_CONFIRM: c_int = 2048;
pub const MSG_RST: c_int = 4096;
pub const MSG_ERRQUEUE: c_int = 8192;
pub const MSG_NOSIGNAL: c_int = 16384;
pub const MSG_MORE: c_int = 32768;
pub const MSG_WAITFORONE: c_int = 65536;
pub const MSG_BATCH: c_int = 262144;
pub const MSG_SOCK_DEVMEM: c_int = 33554432;
pub const MSG_ZEROCOPY: c_int = 67108864;
pub const MSG_FASTOPEN: c_int = 536870912;
pub const MSG_CMSG_CLOEXEC: c_int = 1073741824;
const enum_unnamed_2 = c_uint;
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = null,
    msg_namelen: socklen_t = 0,
    msg_iov: [*c]struct_iovec = null,
    msg_iovlen: usize = 0,
    msg_control: ?*anyopaque = null,
    msg_controllen: usize = 0,
    msg_flags: c_int = 0,
    pub const __cmsg_nxthdr = __root.__cmsg_nxthdr;
    pub const nxthdr = __root.__cmsg_nxthdr;
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: usize = 0,
    cmsg_level: c_int = 0,
    cmsg_type: c_int = 0,
    ___cmsg_data: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn __cmsg_data(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*.___cmsg_data)).array.child) {
        return @ptrCast(@alignCast(&_self.*.___cmsg_data));
    }
};
pub extern fn __cmsg_nxthdr(__mhdr: [*c]struct_msghdr, __cmsg: [*c]struct_cmsghdr) [*c]struct_cmsghdr;
pub const SCM_RIGHTS: c_int = 1;
const enum_unnamed_3 = c_uint;
pub const __kernel_fd_set = extern struct {
    fds_bits: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const __kernel_sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub const __kernel_key_t = c_int;
pub const __kernel_mqd_t = c_int;
pub const __kernel_old_uid_t = c_ushort;
pub const __kernel_old_gid_t = c_ushort;
pub const __kernel_old_dev_t = c_ulong;
pub const __kernel_long_t = c_long;
pub const __kernel_ulong_t = c_ulong;
pub const __kernel_ino_t = __kernel_ulong_t;
pub const __kernel_mode_t = c_uint;
pub const __kernel_pid_t = c_int;
pub const __kernel_ipc_pid_t = c_int;
pub const __kernel_uid_t = c_uint;
pub const __kernel_gid_t = c_uint;
pub const __kernel_suseconds_t = __kernel_long_t;
pub const __kernel_daddr_t = c_int;
pub const __kernel_uid32_t = c_uint;
pub const __kernel_gid32_t = c_uint;
pub const __kernel_size_t = __kernel_ulong_t;
pub const __kernel_ssize_t = __kernel_long_t;
pub const __kernel_ptrdiff_t = __kernel_long_t;
pub const __kernel_fsid_t = extern struct {
    val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __kernel_off_t = __kernel_long_t;
pub const __kernel_loff_t = c_longlong;
pub const __kernel_uoff_t = c_ulonglong;
pub const __kernel_old_time_t = __kernel_long_t;
pub const __kernel_time_t = __kernel_long_t;
pub const __kernel_time64_t = c_longlong;
pub const __kernel_clock_t = __kernel_long_t;
pub const __kernel_timer_t = c_int;
pub const __kernel_clockid_t = c_int;
pub const __kernel_caddr_t = [*c]u8;
pub const __kernel_uid16_t = c_ushort;
pub const __kernel_gid16_t = c_ushort;
pub const struct_linger = extern struct {
    l_onoff: c_int = 0,
    l_linger: c_int = 0,
};
pub const struct_osockaddr = extern struct {
    sa_family: c_ushort = 0,
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const SHUT_RD: c_int = 0;
pub const SHUT_WR: c_int = 1;
pub const SHUT_RDWR: c_int = 2;
const enum_unnamed_4 = c_uint;
pub extern fn socket(__domain: c_int, __type: c_int, __protocol: c_int) c_int;
pub extern fn socketpair(__domain: c_int, __type: c_int, __protocol: c_int, __fds: [*c]c_int) c_int;
pub extern fn bind(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getsockname(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn connect(__fd: c_int, __addr: [*c]const struct_sockaddr, __len: socklen_t) c_int;
pub extern fn getpeername(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __len: [*c]socklen_t) c_int;
pub extern fn send(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn recv(__fd: c_int, __buf: ?*anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn sendto(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int, __addr: [*c]const struct_sockaddr, __addr_len: socklen_t) isize;
pub extern fn recvfrom(__fd: c_int, noalias __buf: ?*anyopaque, __n: usize, __flags: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) isize;
pub extern fn sendmsg(__fd: c_int, __message: [*c]const struct_msghdr, __flags: c_int) isize;
pub extern fn recvmsg(__fd: c_int, __message: [*c]struct_msghdr, __flags: c_int) isize;
pub extern fn getsockopt(__fd: c_int, __level: c_int, __optname: c_int, noalias __optval: ?*anyopaque, noalias __optlen: [*c]socklen_t) c_int;
pub extern fn setsockopt(__fd: c_int, __level: c_int, __optname: c_int, __optval: ?*const anyopaque, __optlen: socklen_t) c_int;
pub extern fn listen(__fd: c_int, __n: c_int) c_int;
pub extern fn accept(__fd: c_int, noalias __addr: [*c]struct_sockaddr, noalias __addr_len: [*c]socklen_t) c_int;
pub extern fn shutdown(__fd: c_int, __how: c_int) c_int;
pub extern fn sockatmark(__fd: c_int) c_int;
pub extern fn isfdtype(__fd: c_int, __fdtype: c_int) c_int;
pub const curl_socklen_t = socklen_t;
pub const curl_off_t = c_long;
pub const struct___va_list_tag_5 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_5;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
const union_unnamed_6 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = 0,
    __value: union_unnamed_6 = @import("std").mem.zeroes(union_unnamed_6),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = 0,
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {}; // /usr/include/bits/types/struct_FILE.h:75:7: warning: struct demoted to opaque type - has bitfield
pub const struct__IO_FILE = opaque {
    pub const fclose = __root.fclose;
    pub const fflush = __root.fflush;
    pub const fflush_unlocked = __root.fflush_unlocked;
    pub const setbuf = __root.setbuf;
    pub const setvbuf = __root.setvbuf;
    pub const setbuffer = __root.setbuffer;
    pub const setlinebuf = __root.setlinebuf;
    pub const fprintf = __root.fprintf;
    pub const vfprintf = __root.vfprintf;
    pub const fscanf = __root.fscanf;
    pub const vfscanf = __root.vfscanf;
    pub const fgetc = __root.fgetc;
    pub const getc = __root.getc;
    pub const getc_unlocked = __root.getc_unlocked;
    pub const fgetc_unlocked = __root.fgetc_unlocked;
    pub const getw = __root.getw;
    pub const fseek = __root.fseek;
    pub const ftell = __root.ftell;
    pub const rewind = __root.rewind;
    pub const fseeko = __root.fseeko;
    pub const ftello = __root.ftello;
    pub const fgetpos = __root.fgetpos;
    pub const fsetpos = __root.fsetpos;
    pub const clearerr = __root.clearerr;
    pub const feof = __root.feof;
    pub const ferror = __root.ferror;
    pub const clearerr_unlocked = __root.clearerr_unlocked;
    pub const feof_unlocked = __root.feof_unlocked;
    pub const ferror_unlocked = __root.ferror_unlocked;
    pub const fileno = __root.fileno;
    pub const fileno_unlocked = __root.fileno_unlocked;
    pub const pclose = __root.pclose;
    pub const flockfile = __root.flockfile;
    pub const ftrylockfile = __root.ftrylockfile;
    pub const funlockfile = __root.funlockfile;
    pub const __uflow = __root.__uflow;
    pub const __overflow = __root.__overflow;
    pub const curl_mfprintf = __root.curl_mfprintf;
    pub const curl_mvfprintf = __root.curl_mvfprintf;
    pub const unlocked = __root.fflush_unlocked;
    pub const uflow = __root.__uflow;
    pub const overflow = __root.__overflow;
    pub const mfprintf = __root.curl_mfprintf;
    pub const mvfprintf = __root.curl_mvfprintf;
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const _IO_lock_t = anyopaque;
pub const cookie_read_function_t = fn (__cookie: ?*anyopaque, __buf: [*c]u8, __nbytes: usize) callconv(.c) __ssize_t;
pub const cookie_write_function_t = fn (__cookie: ?*anyopaque, __buf: [*c]const u8, __nbytes: usize) callconv(.c) __ssize_t;
pub const cookie_seek_function_t = fn (__cookie: ?*anyopaque, __pos: [*c]__off64_t, __w: c_int) callconv(.c) c_int;
pub const cookie_close_function_t = fn (__cookie: ?*anyopaque) callconv(.c) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = null,
    write: ?*const cookie_write_function_t = null,
    seek: ?*const cookie_seek_function_t = null,
    close: ?*const cookie_close_function_t = null,
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const fpos_t = __fpos_t;
pub extern var stdin: ?*FILE;
pub extern var stdout: ?*FILE;
pub extern var stderr: ?*FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: ?*FILE) c_int;
pub extern fn tmpfile() ?*FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: ?*FILE) c_int;
pub extern fn fflush_unlocked(__stream: ?*FILE) c_int;
pub extern fn fopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) ?*FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: ?*FILE) ?*FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) ?*FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) ?*FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) ?*FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) ?*FILE;
pub extern fn setbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: ?*FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: ?*FILE) void;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn vprintf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn vsprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: usize, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: ?*FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_5) c_int;
pub extern fn fgetc(__stream: ?*FILE) c_int;
pub extern fn getc(__stream: ?*FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: ?*FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: ?*FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: ?*FILE) c_int;
pub extern fn putw(__w: c_int, __stream: ?*FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: ?*FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: ?*FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: ?*FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: ?*FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: ?*FILE) c_int;
pub extern fn fread(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __s: ?*FILE) usize;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: ?*FILE) usize;
pub extern fn fseek(__stream: ?*FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: ?*FILE) c_long;
pub extern fn rewind(__stream: ?*FILE) void;
pub extern fn fseeko(__stream: ?*FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: ?*FILE) __off_t;
pub extern fn fgetpos(noalias __stream: ?*FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: ?*FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: ?*FILE) void;
pub extern fn feof(__stream: ?*FILE) c_int;
pub extern fn ferror(__stream: ?*FILE) c_int;
pub extern fn clearerr_unlocked(__stream: ?*FILE) void;
pub extern fn feof_unlocked(__stream: ?*FILE) c_int;
pub extern fn ferror_unlocked(__stream: ?*FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: ?*FILE) c_int;
pub extern fn fileno_unlocked(__stream: ?*FILE) c_int;
pub extern fn pclose(__stream: ?*FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) ?*FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: ?*FILE) void;
pub extern fn ftrylockfile(__stream: ?*FILE) c_int;
pub extern fn funlockfile(__stream: ?*FILE) void;
pub extern fn __uflow(?*FILE) c_int;
pub extern fn __overflow(?*FILE, c_int) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int = 0,
    tm_min: c_int = 0,
    tm_hour: c_int = 0,
    tm_mday: c_int = 0,
    tm_mon: c_int = 0,
    tm_year: c_int = 0,
    tm_wday: c_int = 0,
    tm_yday: c_int = 0,
    tm_isdst: c_int = 0,
    tm_gmtoff: c_long = 0,
    tm_zone: [*c]const u8 = null,
    pub const mktime = __root.mktime;
    pub const asctime = __root.asctime;
    pub const asctime_r = __root.asctime_r;
    pub const timegm = __root.timegm;
    pub const timelocal = __root.timelocal;
    pub const r = __root.asctime_r;
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const struct_sigevent = opaque {};
pub const struct___locale_data_7 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_7 = @import("std").mem.zeroes([13]?*struct___locale_data_7),
    __ctype_b: [*c]const c_ushort = null,
    __ctype_tolower: [*c]const c_int = null,
    __ctype_toupper: [*c]const c_int = null,
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2][*c]u8;
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2][*c]u8;
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: ?*struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = 0,
    tz_dsttime: c_int = 0,
};
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn settimeofday(__tv: [*c]const struct_timeval, __tz: [*c]const struct_timezone) c_int;
pub extern fn adjtime(__delta: [*c]const struct_timeval, __olddelta: [*c]struct_timeval) c_int;
pub const ITIMER_REAL: c_int = 0;
pub const ITIMER_VIRTUAL: c_int = 1;
pub const ITIMER_PROF: c_int = 2;
pub const enum___itimer_which = c_uint;
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const __itimer_which_t = c_int;
pub extern fn getitimer(__which: __itimer_which_t, __value: [*c]struct_itimerval) c_int;
pub extern fn setitimer(__which: __itimer_which_t, noalias __new: [*c]const struct_itimerval, noalias __old: [*c]struct_itimerval) c_int;
pub extern fn utimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn lutimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimes(__fd: c_int, __tvp: [*c]const struct_timeval) c_int;
pub const CURL = anyopaque;
pub const CURLSH = anyopaque;
pub const curl_socket_t = c_int;
pub const CURLSSLBACKEND_NONE: c_int = 0;
pub const CURLSSLBACKEND_OPENSSL: c_int = 1;
pub const CURLSSLBACKEND_GNUTLS: c_int = 2;
pub const CURLSSLBACKEND_NSS: c_int = 3;
pub const CURLSSLBACKEND_OBSOLETE4: c_int = 4;
pub const CURLSSLBACKEND_GSKIT: c_int = 5;
pub const CURLSSLBACKEND_POLARSSL: c_int = 6;
pub const CURLSSLBACKEND_WOLFSSL: c_int = 7;
pub const CURLSSLBACKEND_SCHANNEL: c_int = 8;
pub const CURLSSLBACKEND_SECURETRANSPORT: c_int = 9;
pub const CURLSSLBACKEND_AXTLS: c_int = 10;
pub const CURLSSLBACKEND_MBEDTLS: c_int = 11;
pub const CURLSSLBACKEND_MESALINK: c_int = 12;
pub const CURLSSLBACKEND_BEARSSL: c_int = 13;
pub const CURLSSLBACKEND_RUSTLS: c_int = 14;
pub const curl_sslbackend = c_uint;
pub const struct_curl_slist = extern struct {
    data: [*c]u8 = null,
    next: [*c]struct_curl_slist = null,
    pub const curl_slist_append = __root.curl_slist_append;
    pub const curl_slist_free_all = __root.curl_slist_free_all;
    pub const append = __root.curl_slist_append;
    pub const free_all = __root.curl_slist_free_all;
};
pub const struct_curl_httppost = extern struct {
    next: [*c]struct_curl_httppost = null,
    name: [*c]u8 = null,
    namelength: c_long = 0,
    contents: [*c]u8 = null,
    contentslength: c_long = 0,
    buffer: [*c]u8 = null,
    bufferlength: c_long = 0,
    contenttype: [*c]u8 = null,
    contentheader: [*c]struct_curl_slist = null,
    more: [*c]struct_curl_httppost = null,
    flags: c_long = 0,
    showfilename: [*c]u8 = null,
    userp: ?*anyopaque = null,
    contentlen: curl_off_t = 0,
    pub const curl_formget = __root.curl_formget;
    pub const curl_formfree = __root.curl_formfree;
    pub const formget = __root.curl_formget;
    pub const formfree = __root.curl_formfree;
};
pub const curl_progress_callback = ?*const fn (clientp: ?*anyopaque, dltotal: f64, dlnow: f64, ultotal: f64, ulnow: f64) callconv(.c) c_int;
pub const curl_xferinfo_callback = ?*const fn (clientp: ?*anyopaque, dltotal: curl_off_t, dlnow: curl_off_t, ultotal: curl_off_t, ulnow: curl_off_t) callconv(.c) c_int;
pub const curl_write_callback = ?*const fn (buffer: [*c]u8, size: usize, nitems: usize, outstream: ?*anyopaque) callconv(.c) usize;
pub const curl_resolver_start_callback = ?*const fn (resolver_state: ?*anyopaque, reserved: ?*anyopaque, userdata: ?*anyopaque) callconv(.c) c_int;
pub const CURLFILETYPE_FILE: c_int = 0;
pub const CURLFILETYPE_DIRECTORY: c_int = 1;
pub const CURLFILETYPE_SYMLINK: c_int = 2;
pub const CURLFILETYPE_DEVICE_BLOCK: c_int = 3;
pub const CURLFILETYPE_DEVICE_CHAR: c_int = 4;
pub const CURLFILETYPE_NAMEDPIPE: c_int = 5;
pub const CURLFILETYPE_SOCKET: c_int = 6;
pub const CURLFILETYPE_DOOR: c_int = 7;
pub const CURLFILETYPE_UNKNOWN: c_int = 8;
pub const curlfiletype = c_uint;
const struct_unnamed_8 = extern struct {
    time: [*c]u8 = null,
    perm: [*c]u8 = null,
    user: [*c]u8 = null,
    group: [*c]u8 = null,
    target: [*c]u8 = null,
};
pub const struct_curl_fileinfo = extern struct {
    filename: [*c]u8 = null,
    filetype: curlfiletype = @import("std").mem.zeroes(curlfiletype),
    time: time_t = 0,
    perm: c_uint = 0,
    uid: c_int = 0,
    gid: c_int = 0,
    size: curl_off_t = 0,
    hardlinks: c_long = 0,
    strings: struct_unnamed_8 = @import("std").mem.zeroes(struct_unnamed_8),
    flags: c_uint = 0,
    b_data: [*c]u8 = null,
    b_size: usize = 0,
    b_used: usize = 0,
};
pub const curl_chunk_bgn_callback = ?*const fn (transfer_info: ?*const anyopaque, ptr: ?*anyopaque, remains: c_int) callconv(.c) c_long;
pub const curl_chunk_end_callback = ?*const fn (ptr: ?*anyopaque) callconv(.c) c_long;
pub const curl_fnmatch_callback = ?*const fn (ptr: ?*anyopaque, pattern: [*c]const u8, string: [*c]const u8) callconv(.c) c_int;
pub const curl_seek_callback = ?*const fn (instream: ?*anyopaque, offset: curl_off_t, origin: c_int) callconv(.c) c_int;
pub const curl_read_callback = ?*const fn (buffer: [*c]u8, size: usize, nitems: usize, instream: ?*anyopaque) callconv(.c) usize;
pub const curl_trailer_callback = ?*const fn (list: [*c][*c]struct_curl_slist, userdata: ?*anyopaque) callconv(.c) c_int;
pub const CURLSOCKTYPE_IPCXN: c_int = 0;
pub const CURLSOCKTYPE_ACCEPT: c_int = 1;
pub const CURLSOCKTYPE_LAST: c_int = 2;
pub const curlsocktype = c_uint;
pub const curl_sockopt_callback = ?*const fn (clientp: ?*anyopaque, curlfd: curl_socket_t, purpose: curlsocktype) callconv(.c) c_int;
pub const struct_curl_sockaddr = extern struct {
    family: c_int = 0,
    socktype: c_int = 0,
    protocol: c_int = 0,
    addrlen: c_uint = 0,
    addr: struct_sockaddr = @import("std").mem.zeroes(struct_sockaddr),
};
pub const curl_opensocket_callback = ?*const fn (clientp: ?*anyopaque, purpose: curlsocktype, address: [*c]struct_curl_sockaddr) callconv(.c) curl_socket_t;
pub const curl_closesocket_callback = ?*const fn (clientp: ?*anyopaque, item: curl_socket_t) callconv(.c) c_int;
pub const CURLIOE_OK: c_int = 0;
pub const CURLIOE_UNKNOWNCMD: c_int = 1;
pub const CURLIOE_FAILRESTART: c_int = 2;
pub const CURLIOE_LAST: c_int = 3;
pub const curlioerr = c_uint;
pub const CURLIOCMD_NOP: c_int = 0;
pub const CURLIOCMD_RESTARTREAD: c_int = 1;
pub const CURLIOCMD_LAST: c_int = 2;
pub const curliocmd = c_uint;
pub const curl_ioctl_callback = ?*const fn (handle: ?*CURL, cmd: c_int, clientp: ?*anyopaque) callconv(.c) curlioerr;
pub const curl_malloc_callback = ?*const fn (size: usize) callconv(.c) ?*anyopaque;
pub const curl_free_callback = ?*const fn (ptr: ?*anyopaque) callconv(.c) void;
pub const curl_realloc_callback = ?*const fn (ptr: ?*anyopaque, size: usize) callconv(.c) ?*anyopaque;
pub const curl_strdup_callback = ?*const fn (str: [*c]const u8) callconv(.c) [*c]u8;
pub const curl_calloc_callback = ?*const fn (nmemb: usize, size: usize) callconv(.c) ?*anyopaque;
pub const CURLINFO_TEXT: c_int = 0;
pub const CURLINFO_HEADER_IN: c_int = 1;
pub const CURLINFO_HEADER_OUT: c_int = 2;
pub const CURLINFO_DATA_IN: c_int = 3;
pub const CURLINFO_DATA_OUT: c_int = 4;
pub const CURLINFO_SSL_DATA_IN: c_int = 5;
pub const CURLINFO_SSL_DATA_OUT: c_int = 6;
pub const CURLINFO_END: c_int = 7;
pub const curl_infotype = c_uint;
pub const curl_debug_callback = ?*const fn (handle: ?*CURL, @"type": curl_infotype, data: [*c]u8, size: usize, userptr: ?*anyopaque) callconv(.c) c_int;
pub const curl_prereq_callback = ?*const fn (clientp: ?*anyopaque, conn_primary_ip: [*c]u8, conn_local_ip: [*c]u8, conn_primary_port: c_int, conn_local_port: c_int) callconv(.c) c_int;
pub const CURLE_OK: c_int = 0;
pub const CURLE_UNSUPPORTED_PROTOCOL: c_int = 1;
pub const CURLE_FAILED_INIT: c_int = 2;
pub const CURLE_URL_MALFORMAT: c_int = 3;
pub const CURLE_NOT_BUILT_IN: c_int = 4;
pub const CURLE_COULDNT_RESOLVE_PROXY: c_int = 5;
pub const CURLE_COULDNT_RESOLVE_HOST: c_int = 6;
pub const CURLE_COULDNT_CONNECT: c_int = 7;
pub const CURLE_WEIRD_SERVER_REPLY: c_int = 8;
pub const CURLE_REMOTE_ACCESS_DENIED: c_int = 9;
pub const CURLE_FTP_ACCEPT_FAILED: c_int = 10;
pub const CURLE_FTP_WEIRD_PASS_REPLY: c_int = 11;
pub const CURLE_FTP_ACCEPT_TIMEOUT: c_int = 12;
pub const CURLE_FTP_WEIRD_PASV_REPLY: c_int = 13;
pub const CURLE_FTP_WEIRD_227_FORMAT: c_int = 14;
pub const CURLE_FTP_CANT_GET_HOST: c_int = 15;
pub const CURLE_HTTP2: c_int = 16;
pub const CURLE_FTP_COULDNT_SET_TYPE: c_int = 17;
pub const CURLE_PARTIAL_FILE: c_int = 18;
pub const CURLE_FTP_COULDNT_RETR_FILE: c_int = 19;
pub const CURLE_OBSOLETE20: c_int = 20;
pub const CURLE_QUOTE_ERROR: c_int = 21;
pub const CURLE_HTTP_RETURNED_ERROR: c_int = 22;
pub const CURLE_WRITE_ERROR: c_int = 23;
pub const CURLE_OBSOLETE24: c_int = 24;
pub const CURLE_UPLOAD_FAILED: c_int = 25;
pub const CURLE_READ_ERROR: c_int = 26;
pub const CURLE_OUT_OF_MEMORY: c_int = 27;
pub const CURLE_OPERATION_TIMEDOUT: c_int = 28;
pub const CURLE_OBSOLETE29: c_int = 29;
pub const CURLE_FTP_PORT_FAILED: c_int = 30;
pub const CURLE_FTP_COULDNT_USE_REST: c_int = 31;
pub const CURLE_OBSOLETE32: c_int = 32;
pub const CURLE_RANGE_ERROR: c_int = 33;
pub const CURLE_OBSOLETE34: c_int = 34;
pub const CURLE_SSL_CONNECT_ERROR: c_int = 35;
pub const CURLE_BAD_DOWNLOAD_RESUME: c_int = 36;
pub const CURLE_FILE_COULDNT_READ_FILE: c_int = 37;
pub const CURLE_LDAP_CANNOT_BIND: c_int = 38;
pub const CURLE_LDAP_SEARCH_FAILED: c_int = 39;
pub const CURLE_OBSOLETE40: c_int = 40;
pub const CURLE_OBSOLETE41: c_int = 41;
pub const CURLE_ABORTED_BY_CALLBACK: c_int = 42;
pub const CURLE_BAD_FUNCTION_ARGUMENT: c_int = 43;
pub const CURLE_OBSOLETE44: c_int = 44;
pub const CURLE_INTERFACE_FAILED: c_int = 45;
pub const CURLE_OBSOLETE46: c_int = 46;
pub const CURLE_TOO_MANY_REDIRECTS: c_int = 47;
pub const CURLE_UNKNOWN_OPTION: c_int = 48;
pub const CURLE_SETOPT_OPTION_SYNTAX: c_int = 49;
pub const CURLE_OBSOLETE50: c_int = 50;
pub const CURLE_OBSOLETE51: c_int = 51;
pub const CURLE_GOT_NOTHING: c_int = 52;
pub const CURLE_SSL_ENGINE_NOTFOUND: c_int = 53;
pub const CURLE_SSL_ENGINE_SETFAILED: c_int = 54;
pub const CURLE_SEND_ERROR: c_int = 55;
pub const CURLE_RECV_ERROR: c_int = 56;
pub const CURLE_OBSOLETE57: c_int = 57;
pub const CURLE_SSL_CERTPROBLEM: c_int = 58;
pub const CURLE_SSL_CIPHER: c_int = 59;
pub const CURLE_PEER_FAILED_VERIFICATION: c_int = 60;
pub const CURLE_BAD_CONTENT_ENCODING: c_int = 61;
pub const CURLE_OBSOLETE62: c_int = 62;
pub const CURLE_FILESIZE_EXCEEDED: c_int = 63;
pub const CURLE_USE_SSL_FAILED: c_int = 64;
pub const CURLE_SEND_FAIL_REWIND: c_int = 65;
pub const CURLE_SSL_ENGINE_INITFAILED: c_int = 66;
pub const CURLE_LOGIN_DENIED: c_int = 67;
pub const CURLE_TFTP_NOTFOUND: c_int = 68;
pub const CURLE_TFTP_PERM: c_int = 69;
pub const CURLE_REMOTE_DISK_FULL: c_int = 70;
pub const CURLE_TFTP_ILLEGAL: c_int = 71;
pub const CURLE_TFTP_UNKNOWNID: c_int = 72;
pub const CURLE_REMOTE_FILE_EXISTS: c_int = 73;
pub const CURLE_TFTP_NOSUCHUSER: c_int = 74;
pub const CURLE_OBSOLETE75: c_int = 75;
pub const CURLE_OBSOLETE76: c_int = 76;
pub const CURLE_SSL_CACERT_BADFILE: c_int = 77;
pub const CURLE_REMOTE_FILE_NOT_FOUND: c_int = 78;
pub const CURLE_SSH: c_int = 79;
pub const CURLE_SSL_SHUTDOWN_FAILED: c_int = 80;
pub const CURLE_AGAIN: c_int = 81;
pub const CURLE_SSL_CRL_BADFILE: c_int = 82;
pub const CURLE_SSL_ISSUER_ERROR: c_int = 83;
pub const CURLE_FTP_PRET_FAILED: c_int = 84;
pub const CURLE_RTSP_CSEQ_ERROR: c_int = 85;
pub const CURLE_RTSP_SESSION_ERROR: c_int = 86;
pub const CURLE_FTP_BAD_FILE_LIST: c_int = 87;
pub const CURLE_CHUNK_FAILED: c_int = 88;
pub const CURLE_NO_CONNECTION_AVAILABLE: c_int = 89;
pub const CURLE_SSL_PINNEDPUBKEYNOTMATCH: c_int = 90;
pub const CURLE_SSL_INVALIDCERTSTATUS: c_int = 91;
pub const CURLE_HTTP2_STREAM: c_int = 92;
pub const CURLE_RECURSIVE_API_CALL: c_int = 93;
pub const CURLE_AUTH_ERROR: c_int = 94;
pub const CURLE_HTTP3: c_int = 95;
pub const CURLE_QUIC_CONNECT_ERROR: c_int = 96;
pub const CURLE_PROXY: c_int = 97;
pub const CURLE_SSL_CLIENTCERT: c_int = 98;
pub const CURLE_UNRECOVERABLE_POLL: c_int = 99;
pub const CURLE_TOO_LARGE: c_int = 100;
pub const CURLE_ECH_REQUIRED: c_int = 101;
pub const CURL_LAST: c_int = 102;
pub const CURLcode = c_uint;
pub const CURLPX_OK: c_int = 0;
pub const CURLPX_BAD_ADDRESS_TYPE: c_int = 1;
pub const CURLPX_BAD_VERSION: c_int = 2;
pub const CURLPX_CLOSED: c_int = 3;
pub const CURLPX_GSSAPI: c_int = 4;
pub const CURLPX_GSSAPI_PERMSG: c_int = 5;
pub const CURLPX_GSSAPI_PROTECTION: c_int = 6;
pub const CURLPX_IDENTD: c_int = 7;
pub const CURLPX_IDENTD_DIFFER: c_int = 8;
pub const CURLPX_LONG_HOSTNAME: c_int = 9;
pub const CURLPX_LONG_PASSWD: c_int = 10;
pub const CURLPX_LONG_USER: c_int = 11;
pub const CURLPX_NO_AUTH: c_int = 12;
pub const CURLPX_RECV_ADDRESS: c_int = 13;
pub const CURLPX_RECV_AUTH: c_int = 14;
pub const CURLPX_RECV_CONNECT: c_int = 15;
pub const CURLPX_RECV_REQACK: c_int = 16;
pub const CURLPX_REPLY_ADDRESS_TYPE_NOT_SUPPORTED: c_int = 17;
pub const CURLPX_REPLY_COMMAND_NOT_SUPPORTED: c_int = 18;
pub const CURLPX_REPLY_CONNECTION_REFUSED: c_int = 19;
pub const CURLPX_REPLY_GENERAL_SERVER_FAILURE: c_int = 20;
pub const CURLPX_REPLY_HOST_UNREACHABLE: c_int = 21;
pub const CURLPX_REPLY_NETWORK_UNREACHABLE: c_int = 22;
pub const CURLPX_REPLY_NOT_ALLOWED: c_int = 23;
pub const CURLPX_REPLY_TTL_EXPIRED: c_int = 24;
pub const CURLPX_REPLY_UNASSIGNED: c_int = 25;
pub const CURLPX_REQUEST_FAILED: c_int = 26;
pub const CURLPX_RESOLVE_HOST: c_int = 27;
pub const CURLPX_SEND_AUTH: c_int = 28;
pub const CURLPX_SEND_CONNECT: c_int = 29;
pub const CURLPX_SEND_REQUEST: c_int = 30;
pub const CURLPX_UNKNOWN_FAIL: c_int = 31;
pub const CURLPX_UNKNOWN_MODE: c_int = 32;
pub const CURLPX_USER_REJECTED: c_int = 33;
pub const CURLPX_LAST: c_int = 34;
pub const CURLproxycode = c_uint;
pub const curl_conv_callback = ?*const fn (buffer: [*c]u8, length: usize) callconv(.c) CURLcode;
pub const curl_ssl_ctx_callback = ?*const fn (curl: ?*CURL, ssl_ctx: ?*anyopaque, userptr: ?*anyopaque) callconv(.c) CURLcode;
pub const CURLPROXY_LAST: c_int = 9;
pub const curl_proxytype = c_uint;
pub const CURLKHTYPE_UNKNOWN: c_int = 0;
pub const CURLKHTYPE_RSA1: c_int = 1;
pub const CURLKHTYPE_RSA: c_int = 2;
pub const CURLKHTYPE_DSS: c_int = 3;
pub const CURLKHTYPE_ECDSA: c_int = 4;
pub const CURLKHTYPE_ED25519: c_int = 5;
pub const enum_curl_khtype = c_uint;
pub const struct_curl_khkey = extern struct {
    key: [*c]const u8 = null,
    len: usize = 0,
    keytype: enum_curl_khtype = @import("std").mem.zeroes(enum_curl_khtype),
};
pub const CURLKHSTAT_FINE_ADD_TO_FILE: c_int = 0;
pub const CURLKHSTAT_FINE: c_int = 1;
pub const CURLKHSTAT_REJECT: c_int = 2;
pub const CURLKHSTAT_DEFER: c_int = 3;
pub const CURLKHSTAT_FINE_REPLACE: c_int = 4;
pub const CURLKHSTAT_LAST: c_int = 5;
pub const enum_curl_khstat = c_uint;
pub const CURLKHMATCH_OK: c_int = 0;
pub const CURLKHMATCH_MISMATCH: c_int = 1;
pub const CURLKHMATCH_MISSING: c_int = 2;
pub const CURLKHMATCH_LAST: c_int = 3;
pub const enum_curl_khmatch = c_uint;
pub const curl_sshkeycallback = ?*const fn (easy: ?*CURL, knownkey: [*c]const struct_curl_khkey, foundkey: [*c]const struct_curl_khkey, enum_curl_khmatch, clientp: ?*anyopaque) callconv(.c) c_int;
pub const curl_sshhostkeycallback = ?*const fn (clientp: ?*anyopaque, keytype: c_int, key: [*c]const u8, keylen: usize) callconv(.c) c_int;
pub const CURLUSESSL_LAST: c_int = 4;
pub const curl_usessl = c_uint;
pub const CURLFTPSSL_CCC_LAST: c_int = 3;
pub const curl_ftpccc = c_uint;
pub const CURLFTPAUTH_LAST: c_int = 3;
pub const curl_ftpauth = c_uint;
pub const CURLFTP_CREATE_DIR_LAST: c_int = 3;
pub const curl_ftpcreatedir = c_uint;
pub const CURLFTPMETHOD_LAST: c_int = 4;
pub const curl_ftpmethod = c_uint; // /usr/include/curl/curl.h:1059:16: warning: struct demoted to opaque type - has bitfield
pub const struct_curl_hstsentry = opaque {};
pub const struct_curl_index = extern struct {
    index: usize = 0,
    total: usize = 0,
};
pub const CURLSTS_OK: c_int = 0;
pub const CURLSTS_DONE: c_int = 1;
pub const CURLSTS_FAIL: c_int = 2;
pub const CURLSTScode = c_uint;
pub const curl_hstsread_callback = ?*const fn (easy: ?*CURL, e: ?*struct_curl_hstsentry, userp: ?*anyopaque) callconv(.c) CURLSTScode;
pub const curl_hstswrite_callback = ?*const fn (easy: ?*CURL, e: ?*struct_curl_hstsentry, i: [*c]struct_curl_index, userp: ?*anyopaque) callconv(.c) CURLSTScode;
pub const CURLOPT_WRITEDATA: c_int = 10001;
pub const CURLOPT_URL: c_int = 10002;
pub const CURLOPT_PORT: c_int = 3;
pub const CURLOPT_PROXY: c_int = 10004;
pub const CURLOPT_USERPWD: c_int = 10005;
pub const CURLOPT_PROXYUSERPWD: c_int = 10006;
pub const CURLOPT_RANGE: c_int = 10007;
pub const CURLOPT_READDATA: c_int = 10009;
pub const CURLOPT_ERRORBUFFER: c_int = 10010;
pub const CURLOPT_WRITEFUNCTION: c_int = 20011;
pub const CURLOPT_READFUNCTION: c_int = 20012;
pub const CURLOPT_TIMEOUT: c_int = 13;
pub const CURLOPT_INFILESIZE: c_int = 14;
pub const CURLOPT_POSTFIELDS: c_int = 10015;
pub const CURLOPT_REFERER: c_int = 10016;
pub const CURLOPT_FTPPORT: c_int = 10017;
pub const CURLOPT_USERAGENT: c_int = 10018;
pub const CURLOPT_LOW_SPEED_LIMIT: c_int = 19;
pub const CURLOPT_LOW_SPEED_TIME: c_int = 20;
pub const CURLOPT_RESUME_FROM: c_int = 21;
pub const CURLOPT_COOKIE: c_int = 10022;
pub const CURLOPT_HTTPHEADER: c_int = 10023;
pub const CURLOPT_HTTPPOST: c_int = 10024;
pub const CURLOPT_SSLCERT: c_int = 10025;
pub const CURLOPT_KEYPASSWD: c_int = 10026;
pub const CURLOPT_CRLF: c_int = 27;
pub const CURLOPT_QUOTE: c_int = 10028;
pub const CURLOPT_HEADERDATA: c_int = 10029;
pub const CURLOPT_COOKIEFILE: c_int = 10031;
pub const CURLOPT_SSLVERSION: c_int = 32;
pub const CURLOPT_TIMECONDITION: c_int = 33;
pub const CURLOPT_TIMEVALUE: c_int = 34;
pub const CURLOPT_CUSTOMREQUEST: c_int = 10036;
pub const CURLOPT_STDERR: c_int = 10037;
pub const CURLOPT_POSTQUOTE: c_int = 10039;
pub const CURLOPT_VERBOSE: c_int = 41;
pub const CURLOPT_HEADER: c_int = 42;
pub const CURLOPT_NOPROGRESS: c_int = 43;
pub const CURLOPT_NOBODY: c_int = 44;
pub const CURLOPT_FAILONERROR: c_int = 45;
pub const CURLOPT_UPLOAD: c_int = 46;
pub const CURLOPT_POST: c_int = 47;
pub const CURLOPT_DIRLISTONLY: c_int = 48;
pub const CURLOPT_APPEND: c_int = 50;
pub const CURLOPT_NETRC: c_int = 51;
pub const CURLOPT_FOLLOWLOCATION: c_int = 52;
pub const CURLOPT_TRANSFERTEXT: c_int = 53;
pub const CURLOPT_PUT: c_int = 54;
pub const CURLOPT_PROGRESSFUNCTION: c_int = 20056;
pub const CURLOPT_XFERINFODATA: c_int = 10057;
pub const CURLOPT_AUTOREFERER: c_int = 58;
pub const CURLOPT_PROXYPORT: c_int = 59;
pub const CURLOPT_POSTFIELDSIZE: c_int = 60;
pub const CURLOPT_HTTPPROXYTUNNEL: c_int = 61;
pub const CURLOPT_INTERFACE: c_int = 10062;
pub const CURLOPT_KRBLEVEL: c_int = 10063;
pub const CURLOPT_SSL_VERIFYPEER: c_int = 64;
pub const CURLOPT_CAINFO: c_int = 10065;
pub const CURLOPT_MAXREDIRS: c_int = 68;
pub const CURLOPT_FILETIME: c_int = 69;
pub const CURLOPT_TELNETOPTIONS: c_int = 10070;
pub const CURLOPT_MAXCONNECTS: c_int = 71;
pub const CURLOPT_FRESH_CONNECT: c_int = 74;
pub const CURLOPT_FORBID_REUSE: c_int = 75;
pub const CURLOPT_RANDOM_FILE: c_int = 10076;
pub const CURLOPT_EGDSOCKET: c_int = 10077;
pub const CURLOPT_CONNECTTIMEOUT: c_int = 78;
pub const CURLOPT_HEADERFUNCTION: c_int = 20079;
pub const CURLOPT_HTTPGET: c_int = 80;
pub const CURLOPT_SSL_VERIFYHOST: c_int = 81;
pub const CURLOPT_COOKIEJAR: c_int = 10082;
pub const CURLOPT_SSL_CIPHER_LIST: c_int = 10083;
pub const CURLOPT_HTTP_VERSION: c_int = 84;
pub const CURLOPT_FTP_USE_EPSV: c_int = 85;
pub const CURLOPT_SSLCERTTYPE: c_int = 10086;
pub const CURLOPT_SSLKEY: c_int = 10087;
pub const CURLOPT_SSLKEYTYPE: c_int = 10088;
pub const CURLOPT_SSLENGINE: c_int = 10089;
pub const CURLOPT_SSLENGINE_DEFAULT: c_int = 90;
pub const CURLOPT_DNS_USE_GLOBAL_CACHE: c_int = 91;
pub const CURLOPT_DNS_CACHE_TIMEOUT: c_int = 92;
pub const CURLOPT_PREQUOTE: c_int = 10093;
pub const CURLOPT_DEBUGFUNCTION: c_int = 20094;
pub const CURLOPT_DEBUGDATA: c_int = 10095;
pub const CURLOPT_COOKIESESSION: c_int = 96;
pub const CURLOPT_CAPATH: c_int = 10097;
pub const CURLOPT_BUFFERSIZE: c_int = 98;
pub const CURLOPT_NOSIGNAL: c_int = 99;
pub const CURLOPT_SHARE: c_int = 10100;
pub const CURLOPT_PROXYTYPE: c_int = 101;
pub const CURLOPT_ACCEPT_ENCODING: c_int = 10102;
pub const CURLOPT_PRIVATE: c_int = 10103;
pub const CURLOPT_HTTP200ALIASES: c_int = 10104;
pub const CURLOPT_UNRESTRICTED_AUTH: c_int = 105;
pub const CURLOPT_FTP_USE_EPRT: c_int = 106;
pub const CURLOPT_HTTPAUTH: c_int = 107;
pub const CURLOPT_SSL_CTX_FUNCTION: c_int = 20108;
pub const CURLOPT_SSL_CTX_DATA: c_int = 10109;
pub const CURLOPT_FTP_CREATE_MISSING_DIRS: c_int = 110;
pub const CURLOPT_PROXYAUTH: c_int = 111;
pub const CURLOPT_SERVER_RESPONSE_TIMEOUT: c_int = 112;
pub const CURLOPT_IPRESOLVE: c_int = 113;
pub const CURLOPT_MAXFILESIZE: c_int = 114;
pub const CURLOPT_INFILESIZE_LARGE: c_int = 30115;
pub const CURLOPT_RESUME_FROM_LARGE: c_int = 30116;
pub const CURLOPT_MAXFILESIZE_LARGE: c_int = 30117;
pub const CURLOPT_NETRC_FILE: c_int = 10118;
pub const CURLOPT_USE_SSL: c_int = 119;
pub const CURLOPT_POSTFIELDSIZE_LARGE: c_int = 30120;
pub const CURLOPT_TCP_NODELAY: c_int = 121;
pub const CURLOPT_FTPSSLAUTH: c_int = 129;
pub const CURLOPT_IOCTLFUNCTION: c_int = 20130;
pub const CURLOPT_IOCTLDATA: c_int = 10131;
pub const CURLOPT_FTP_ACCOUNT: c_int = 10134;
pub const CURLOPT_COOKIELIST: c_int = 10135;
pub const CURLOPT_IGNORE_CONTENT_LENGTH: c_int = 136;
pub const CURLOPT_FTP_SKIP_PASV_IP: c_int = 137;
pub const CURLOPT_FTP_FILEMETHOD: c_int = 138;
pub const CURLOPT_LOCALPORT: c_int = 139;
pub const CURLOPT_LOCALPORTRANGE: c_int = 140;
pub const CURLOPT_CONNECT_ONLY: c_int = 141;
pub const CURLOPT_CONV_FROM_NETWORK_FUNCTION: c_int = 20142;
pub const CURLOPT_CONV_TO_NETWORK_FUNCTION: c_int = 20143;
pub const CURLOPT_CONV_FROM_UTF8_FUNCTION: c_int = 20144;
pub const CURLOPT_MAX_SEND_SPEED_LARGE: c_int = 30145;
pub const CURLOPT_MAX_RECV_SPEED_LARGE: c_int = 30146;
pub const CURLOPT_FTP_ALTERNATIVE_TO_USER: c_int = 10147;
pub const CURLOPT_SOCKOPTFUNCTION: c_int = 20148;
pub const CURLOPT_SOCKOPTDATA: c_int = 10149;
pub const CURLOPT_SSL_SESSIONID_CACHE: c_int = 150;
pub const CURLOPT_SSH_AUTH_TYPES: c_int = 151;
pub const CURLOPT_SSH_PUBLIC_KEYFILE: c_int = 10152;
pub const CURLOPT_SSH_PRIVATE_KEYFILE: c_int = 10153;
pub const CURLOPT_FTP_SSL_CCC: c_int = 154;
pub const CURLOPT_TIMEOUT_MS: c_int = 155;
pub const CURLOPT_CONNECTTIMEOUT_MS: c_int = 156;
pub const CURLOPT_HTTP_TRANSFER_DECODING: c_int = 157;
pub const CURLOPT_HTTP_CONTENT_DECODING: c_int = 158;
pub const CURLOPT_NEW_FILE_PERMS: c_int = 159;
pub const CURLOPT_NEW_DIRECTORY_PERMS: c_int = 160;
pub const CURLOPT_POSTREDIR: c_int = 161;
pub const CURLOPT_SSH_HOST_PUBLIC_KEY_MD5: c_int = 10162;
pub const CURLOPT_OPENSOCKETFUNCTION: c_int = 20163;
pub const CURLOPT_OPENSOCKETDATA: c_int = 10164;
pub const CURLOPT_COPYPOSTFIELDS: c_int = 10165;
pub const CURLOPT_PROXY_TRANSFER_MODE: c_int = 166;
pub const CURLOPT_SEEKFUNCTION: c_int = 20167;
pub const CURLOPT_SEEKDATA: c_int = 10168;
pub const CURLOPT_CRLFILE: c_int = 10169;
pub const CURLOPT_ISSUERCERT: c_int = 10170;
pub const CURLOPT_ADDRESS_SCOPE: c_int = 171;
pub const CURLOPT_CERTINFO: c_int = 172;
pub const CURLOPT_USERNAME: c_int = 10173;
pub const CURLOPT_PASSWORD: c_int = 10174;
pub const CURLOPT_PROXYUSERNAME: c_int = 10175;
pub const CURLOPT_PROXYPASSWORD: c_int = 10176;
pub const CURLOPT_NOPROXY: c_int = 10177;
pub const CURLOPT_TFTP_BLKSIZE: c_int = 178;
pub const CURLOPT_SOCKS5_GSSAPI_SERVICE: c_int = 10179;
pub const CURLOPT_SOCKS5_GSSAPI_NEC: c_int = 180;
pub const CURLOPT_PROTOCOLS: c_int = 181;
pub const CURLOPT_REDIR_PROTOCOLS: c_int = 182;
pub const CURLOPT_SSH_KNOWNHOSTS: c_int = 10183;
pub const CURLOPT_SSH_KEYFUNCTION: c_int = 20184;
pub const CURLOPT_SSH_KEYDATA: c_int = 10185;
pub const CURLOPT_MAIL_FROM: c_int = 10186;
pub const CURLOPT_MAIL_RCPT: c_int = 10187;
pub const CURLOPT_FTP_USE_PRET: c_int = 188;
pub const CURLOPT_RTSP_REQUEST: c_int = 189;
pub const CURLOPT_RTSP_SESSION_ID: c_int = 10190;
pub const CURLOPT_RTSP_STREAM_URI: c_int = 10191;
pub const CURLOPT_RTSP_TRANSPORT: c_int = 10192;
pub const CURLOPT_RTSP_CLIENT_CSEQ: c_int = 193;
pub const CURLOPT_RTSP_SERVER_CSEQ: c_int = 194;
pub const CURLOPT_INTERLEAVEDATA: c_int = 10195;
pub const CURLOPT_INTERLEAVEFUNCTION: c_int = 20196;
pub const CURLOPT_WILDCARDMATCH: c_int = 197;
pub const CURLOPT_CHUNK_BGN_FUNCTION: c_int = 20198;
pub const CURLOPT_CHUNK_END_FUNCTION: c_int = 20199;
pub const CURLOPT_FNMATCH_FUNCTION: c_int = 20200;
pub const CURLOPT_CHUNK_DATA: c_int = 10201;
pub const CURLOPT_FNMATCH_DATA: c_int = 10202;
pub const CURLOPT_RESOLVE: c_int = 10203;
pub const CURLOPT_TLSAUTH_USERNAME: c_int = 10204;
pub const CURLOPT_TLSAUTH_PASSWORD: c_int = 10205;
pub const CURLOPT_TLSAUTH_TYPE: c_int = 10206;
pub const CURLOPT_TRANSFER_ENCODING: c_int = 207;
pub const CURLOPT_CLOSESOCKETFUNCTION: c_int = 20208;
pub const CURLOPT_CLOSESOCKETDATA: c_int = 10209;
pub const CURLOPT_GSSAPI_DELEGATION: c_int = 210;
pub const CURLOPT_DNS_SERVERS: c_int = 10211;
pub const CURLOPT_ACCEPTTIMEOUT_MS: c_int = 212;
pub const CURLOPT_TCP_KEEPALIVE: c_int = 213;
pub const CURLOPT_TCP_KEEPIDLE: c_int = 214;
pub const CURLOPT_TCP_KEEPINTVL: c_int = 215;
pub const CURLOPT_SSL_OPTIONS: c_int = 216;
pub const CURLOPT_MAIL_AUTH: c_int = 10217;
pub const CURLOPT_SASL_IR: c_int = 218;
pub const CURLOPT_XFERINFOFUNCTION: c_int = 20219;
pub const CURLOPT_XOAUTH2_BEARER: c_int = 10220;
pub const CURLOPT_DNS_INTERFACE: c_int = 10221;
pub const CURLOPT_DNS_LOCAL_IP4: c_int = 10222;
pub const CURLOPT_DNS_LOCAL_IP6: c_int = 10223;
pub const CURLOPT_LOGIN_OPTIONS: c_int = 10224;
pub const CURLOPT_SSL_ENABLE_NPN: c_int = 225;
pub const CURLOPT_SSL_ENABLE_ALPN: c_int = 226;
pub const CURLOPT_EXPECT_100_TIMEOUT_MS: c_int = 227;
pub const CURLOPT_PROXYHEADER: c_int = 10228;
pub const CURLOPT_HEADEROPT: c_int = 229;
pub const CURLOPT_PINNEDPUBLICKEY: c_int = 10230;
pub const CURLOPT_UNIX_SOCKET_PATH: c_int = 10231;
pub const CURLOPT_SSL_VERIFYSTATUS: c_int = 232;
pub const CURLOPT_SSL_FALSESTART: c_int = 233;
pub const CURLOPT_PATH_AS_IS: c_int = 234;
pub const CURLOPT_PROXY_SERVICE_NAME: c_int = 10235;
pub const CURLOPT_SERVICE_NAME: c_int = 10236;
pub const CURLOPT_PIPEWAIT: c_int = 237;
pub const CURLOPT_DEFAULT_PROTOCOL: c_int = 10238;
pub const CURLOPT_STREAM_WEIGHT: c_int = 239;
pub const CURLOPT_STREAM_DEPENDS: c_int = 10240;
pub const CURLOPT_STREAM_DEPENDS_E: c_int = 10241;
pub const CURLOPT_TFTP_NO_OPTIONS: c_int = 242;
pub const CURLOPT_CONNECT_TO: c_int = 10243;
pub const CURLOPT_TCP_FASTOPEN: c_int = 244;
pub const CURLOPT_KEEP_SENDING_ON_ERROR: c_int = 245;
pub const CURLOPT_PROXY_CAINFO: c_int = 10246;
pub const CURLOPT_PROXY_CAPATH: c_int = 10247;
pub const CURLOPT_PROXY_SSL_VERIFYPEER: c_int = 248;
pub const CURLOPT_PROXY_SSL_VERIFYHOST: c_int = 249;
pub const CURLOPT_PROXY_SSLVERSION: c_int = 250;
pub const CURLOPT_PROXY_TLSAUTH_USERNAME: c_int = 10251;
pub const CURLOPT_PROXY_TLSAUTH_PASSWORD: c_int = 10252;
pub const CURLOPT_PROXY_TLSAUTH_TYPE: c_int = 10253;
pub const CURLOPT_PROXY_SSLCERT: c_int = 10254;
pub const CURLOPT_PROXY_SSLCERTTYPE: c_int = 10255;
pub const CURLOPT_PROXY_SSLKEY: c_int = 10256;
pub const CURLOPT_PROXY_SSLKEYTYPE: c_int = 10257;
pub const CURLOPT_PROXY_KEYPASSWD: c_int = 10258;
pub const CURLOPT_PROXY_SSL_CIPHER_LIST: c_int = 10259;
pub const CURLOPT_PROXY_CRLFILE: c_int = 10260;
pub const CURLOPT_PROXY_SSL_OPTIONS: c_int = 261;
pub const CURLOPT_PRE_PROXY: c_int = 10262;
pub const CURLOPT_PROXY_PINNEDPUBLICKEY: c_int = 10263;
pub const CURLOPT_ABSTRACT_UNIX_SOCKET: c_int = 10264;
pub const CURLOPT_SUPPRESS_CONNECT_HEADERS: c_int = 265;
pub const CURLOPT_REQUEST_TARGET: c_int = 10266;
pub const CURLOPT_SOCKS5_AUTH: c_int = 267;
pub const CURLOPT_SSH_COMPRESSION: c_int = 268;
pub const CURLOPT_MIMEPOST: c_int = 10269;
pub const CURLOPT_TIMEVALUE_LARGE: c_int = 30270;
pub const CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS: c_int = 271;
pub const CURLOPT_RESOLVER_START_FUNCTION: c_int = 20272;
pub const CURLOPT_RESOLVER_START_DATA: c_int = 10273;
pub const CURLOPT_HAPROXYPROTOCOL: c_int = 274;
pub const CURLOPT_DNS_SHUFFLE_ADDRESSES: c_int = 275;
pub const CURLOPT_TLS13_CIPHERS: c_int = 10276;
pub const CURLOPT_PROXY_TLS13_CIPHERS: c_int = 10277;
pub const CURLOPT_DISALLOW_USERNAME_IN_URL: c_int = 278;
pub const CURLOPT_DOH_URL: c_int = 10279;
pub const CURLOPT_UPLOAD_BUFFERSIZE: c_int = 280;
pub const CURLOPT_UPKEEP_INTERVAL_MS: c_int = 281;
pub const CURLOPT_CURLU: c_int = 10282;
pub const CURLOPT_TRAILERFUNCTION: c_int = 20283;
pub const CURLOPT_TRAILERDATA: c_int = 10284;
pub const CURLOPT_HTTP09_ALLOWED: c_int = 285;
pub const CURLOPT_ALTSVC_CTRL: c_int = 286;
pub const CURLOPT_ALTSVC: c_int = 10287;
pub const CURLOPT_MAXAGE_CONN: c_int = 288;
pub const CURLOPT_SASL_AUTHZID: c_int = 10289;
pub const CURLOPT_MAIL_RCPT_ALLOWFAILS: c_int = 290;
pub const CURLOPT_SSLCERT_BLOB: c_int = 40291;
pub const CURLOPT_SSLKEY_BLOB: c_int = 40292;
pub const CURLOPT_PROXY_SSLCERT_BLOB: c_int = 40293;
pub const CURLOPT_PROXY_SSLKEY_BLOB: c_int = 40294;
pub const CURLOPT_ISSUERCERT_BLOB: c_int = 40295;
pub const CURLOPT_PROXY_ISSUERCERT: c_int = 10296;
pub const CURLOPT_PROXY_ISSUERCERT_BLOB: c_int = 40297;
pub const CURLOPT_SSL_EC_CURVES: c_int = 10298;
pub const CURLOPT_HSTS_CTRL: c_int = 299;
pub const CURLOPT_HSTS: c_int = 10300;
pub const CURLOPT_HSTSREADFUNCTION: c_int = 20301;
pub const CURLOPT_HSTSREADDATA: c_int = 10302;
pub const CURLOPT_HSTSWRITEFUNCTION: c_int = 20303;
pub const CURLOPT_HSTSWRITEDATA: c_int = 10304;
pub const CURLOPT_AWS_SIGV4: c_int = 10305;
pub const CURLOPT_DOH_SSL_VERIFYPEER: c_int = 306;
pub const CURLOPT_DOH_SSL_VERIFYHOST: c_int = 307;
pub const CURLOPT_DOH_SSL_VERIFYSTATUS: c_int = 308;
pub const CURLOPT_CAINFO_BLOB: c_int = 40309;
pub const CURLOPT_PROXY_CAINFO_BLOB: c_int = 40310;
pub const CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256: c_int = 10311;
pub const CURLOPT_PREREQFUNCTION: c_int = 20312;
pub const CURLOPT_PREREQDATA: c_int = 10313;
pub const CURLOPT_MAXLIFETIME_CONN: c_int = 314;
pub const CURLOPT_MIME_OPTIONS: c_int = 315;
pub const CURLOPT_SSH_HOSTKEYFUNCTION: c_int = 20316;
pub const CURLOPT_SSH_HOSTKEYDATA: c_int = 10317;
pub const CURLOPT_PROTOCOLS_STR: c_int = 10318;
pub const CURLOPT_REDIR_PROTOCOLS_STR: c_int = 10319;
pub const CURLOPT_WS_OPTIONS: c_int = 320;
pub const CURLOPT_CA_CACHE_TIMEOUT: c_int = 321;
pub const CURLOPT_QUICK_EXIT: c_int = 322;
pub const CURLOPT_HAPROXY_CLIENT_IP: c_int = 10323;
pub const CURLOPT_SERVER_RESPONSE_TIMEOUT_MS: c_int = 324;
pub const CURLOPT_ECH: c_int = 10325;
pub const CURLOPT_TCP_KEEPCNT: c_int = 326;
pub const CURLOPT_UPLOAD_FLAGS: c_int = 327;
pub const CURLOPT_SSL_SIGNATURE_ALGORITHMS: c_int = 10328;
pub const CURLOPT_HTTPSIG_ALGORITHM: c_int = 329;
pub const CURLOPT_HTTPSIG_KEY: c_int = 10330;
pub const CURLOPT_HTTPSIG_KEYID: c_int = 10331;
pub const CURLOPT_HTTPSIG_HEADERS: c_int = 10332;
pub const CURLOPT_LASTENTRY: c_int = 10333;
pub const CURLoption = c_uint;
pub const CURL_NETRC_LAST: c_int = 3;
pub const enum_CURL_NETRC_OPTION = c_uint;
pub const CURL_TLSAUTH_LAST: c_int = 2;
pub const enum_CURL_TLSAUTH = c_uint;
pub const CURL_TIMECOND_LAST: c_int = 4;
pub const curl_TimeCond = c_uint;
pub extern fn curl_strequal(s1: [*c]const u8, s2: [*c]const u8) c_int;
pub extern fn curl_strnequal(s1: [*c]const u8, s2: [*c]const u8, n: usize) c_int;
pub const struct_curl_mime = opaque {
    pub const curl_mime_free = __root.curl_mime_free;
    pub const curl_mime_addpart = __root.curl_mime_addpart;
    pub const free = __root.curl_mime_free;
    pub const addpart = __root.curl_mime_addpart;
};
pub const curl_mime = struct_curl_mime;
pub const struct_curl_mimepart = opaque {
    pub const curl_mime_name = __root.curl_mime_name;
    pub const curl_mime_filename = __root.curl_mime_filename;
    pub const curl_mime_type = __root.curl_mime_type;
    pub const curl_mime_encoder = __root.curl_mime_encoder;
    pub const curl_mime_data = __root.curl_mime_data;
    pub const curl_mime_filedata = __root.curl_mime_filedata;
    pub const curl_mime_data_cb = __root.curl_mime_data_cb;
    pub const curl_mime_subparts = __root.curl_mime_subparts;
    pub const curl_mime_headers = __root.curl_mime_headers;
    pub const name = __root.curl_mime_name;
    pub const filename = __root.curl_mime_filename;
    pub const @"type" = __root.curl_mime_type;
    pub const encoder = __root.curl_mime_encoder;
    pub const data = __root.curl_mime_data;
    pub const filedata = __root.curl_mime_filedata;
    pub const cb = __root.curl_mime_data_cb;
    pub const subparts = __root.curl_mime_subparts;
    pub const headers = __root.curl_mime_headers;
};
pub const curl_mimepart = struct_curl_mimepart;
pub extern fn curl_mime_init(easy: ?*CURL) ?*curl_mime;
pub extern fn curl_mime_free(mime: ?*curl_mime) void;
pub extern fn curl_mime_addpart(mime: ?*curl_mime) ?*curl_mimepart;
pub extern fn curl_mime_name(part: ?*curl_mimepart, name: [*c]const u8) CURLcode;
pub extern fn curl_mime_filename(part: ?*curl_mimepart, filename: [*c]const u8) CURLcode;
pub extern fn curl_mime_type(part: ?*curl_mimepart, mimetype: [*c]const u8) CURLcode;
pub extern fn curl_mime_encoder(part: ?*curl_mimepart, encoding: [*c]const u8) CURLcode;
pub extern fn curl_mime_data(part: ?*curl_mimepart, data: [*c]const u8, datasize: usize) CURLcode;
pub extern fn curl_mime_filedata(part: ?*curl_mimepart, filename: [*c]const u8) CURLcode;
pub extern fn curl_mime_data_cb(part: ?*curl_mimepart, datasize: curl_off_t, readfunc: curl_read_callback, seekfunc: curl_seek_callback, freefunc: curl_free_callback, arg: ?*anyopaque) CURLcode;
pub extern fn curl_mime_subparts(part: ?*curl_mimepart, subparts: ?*curl_mime) CURLcode;
pub extern fn curl_mime_headers(part: ?*curl_mimepart, headers: [*c]struct_curl_slist, take_ownership: c_int) CURLcode;
pub const CURLFORM_NOTHING: c_int = 0;
pub const CURLFORM_COPYNAME: c_int = 1;
pub const CURLFORM_PTRNAME: c_int = 2;
pub const CURLFORM_NAMELENGTH: c_int = 3;
pub const CURLFORM_COPYCONTENTS: c_int = 4;
pub const CURLFORM_PTRCONTENTS: c_int = 5;
pub const CURLFORM_CONTENTSLENGTH: c_int = 6;
pub const CURLFORM_FILECONTENT: c_int = 7;
pub const CURLFORM_ARRAY: c_int = 8;
pub const CURLFORM_OBSOLETE: c_int = 9;
pub const CURLFORM_FILE: c_int = 10;
pub const CURLFORM_BUFFER: c_int = 11;
pub const CURLFORM_BUFFERPTR: c_int = 12;
pub const CURLFORM_BUFFERLENGTH: c_int = 13;
pub const CURLFORM_CONTENTTYPE: c_int = 14;
pub const CURLFORM_CONTENTHEADER: c_int = 15;
pub const CURLFORM_FILENAME: c_int = 16;
pub const CURLFORM_END: c_int = 17;
pub const CURLFORM_OBSOLETE2: c_int = 18;
pub const CURLFORM_STREAM: c_int = 19;
pub const CURLFORM_CONTENTLEN: c_int = 20;
pub const CURLFORM_LASTENTRY: c_int = 21;
pub const CURLformoption = c_uint;
pub const struct_curl_forms = extern struct {
    option: CURLformoption = @import("std").mem.zeroes(CURLformoption),
    value: [*c]const u8 = null,
};
pub const CURL_FORMADD_OK: c_int = 0;
pub const CURL_FORMADD_MEMORY: c_int = 1;
pub const CURL_FORMADD_OPTION_TWICE: c_int = 2;
pub const CURL_FORMADD_NULL: c_int = 3;
pub const CURL_FORMADD_UNKNOWN_OPTION: c_int = 4;
pub const CURL_FORMADD_INCOMPLETE: c_int = 5;
pub const CURL_FORMADD_ILLEGAL_ARRAY: c_int = 6;
pub const CURL_FORMADD_DISABLED: c_int = 7;
pub const CURL_FORMADD_LAST: c_int = 8;
pub const CURLFORMcode = c_uint;
pub extern fn curl_formadd(httppost: [*c][*c]struct_curl_httppost, last_post: [*c][*c]struct_curl_httppost, ...) CURLFORMcode;
pub const curl_formget_callback = ?*const fn (arg: ?*anyopaque, buf: [*c]const u8, len: usize) callconv(.c) usize;
pub extern fn curl_formget(form: [*c]struct_curl_httppost, arg: ?*anyopaque, append: curl_formget_callback) c_int;
pub extern fn curl_formfree(form: [*c]struct_curl_httppost) void;
pub extern fn curl_getenv(variable: [*c]const u8) [*c]u8;
pub extern fn curl_version() [*c]u8;
pub extern fn curl_easy_escape(curl: ?*CURL, string: [*c]const u8, length: c_int) [*c]u8;
pub extern fn curl_escape(string: [*c]const u8, length: c_int) [*c]u8;
pub extern fn curl_easy_unescape(curl: ?*CURL, string: [*c]const u8, inlength: c_int, outlength: [*c]c_int) [*c]u8;
pub extern fn curl_unescape(string: [*c]const u8, length: c_int) [*c]u8;
pub extern fn curl_free(p: ?*anyopaque) void;
pub extern fn curl_global_init(flags: c_long) CURLcode;
pub extern fn curl_global_init_mem(flags: c_long, m: curl_malloc_callback, f: curl_free_callback, r: curl_realloc_callback, s: curl_strdup_callback, c: curl_calloc_callback) CURLcode;
pub extern fn curl_global_cleanup() void;
pub extern fn curl_global_trace(config: [*c]const u8) CURLcode;
pub const struct_curl_ssl_backend = extern struct {
    id: curl_sslbackend = @import("std").mem.zeroes(curl_sslbackend),
    name: [*c]const u8 = null,
};
pub const curl_ssl_backend = struct_curl_ssl_backend;
pub const CURLSSLSET_OK: c_int = 0;
pub const CURLSSLSET_UNKNOWN_BACKEND: c_int = 1;
pub const CURLSSLSET_TOO_LATE: c_int = 2;
pub const CURLSSLSET_NO_BACKENDS: c_int = 3;
pub const CURLsslset = c_uint;
pub extern fn curl_global_sslset(id: curl_sslbackend, name: [*c]const u8, avail: [*c][*c][*c]const curl_ssl_backend) CURLsslset;
pub extern fn curl_slist_append(list: [*c]struct_curl_slist, data: [*c]const u8) [*c]struct_curl_slist;
pub extern fn curl_slist_free_all(list: [*c]struct_curl_slist) void;
pub extern fn curl_getdate(p: [*c]const u8, unused: [*c]const time_t) time_t;
pub const struct_curl_certinfo = extern struct {
    num_of_certs: c_int = 0,
    certinfo: [*c][*c]struct_curl_slist = null,
};
pub const struct_curl_tlssessioninfo = extern struct {
    backend: curl_sslbackend = @import("std").mem.zeroes(curl_sslbackend),
    internals: ?*anyopaque = null,
};
pub const CURLINFO_NONE: c_int = 0;
pub const CURLINFO_EFFECTIVE_URL: c_int = 1048577;
pub const CURLINFO_RESPONSE_CODE: c_int = 2097154;
pub const CURLINFO_TOTAL_TIME: c_int = 3145731;
pub const CURLINFO_NAMELOOKUP_TIME: c_int = 3145732;
pub const CURLINFO_CONNECT_TIME: c_int = 3145733;
pub const CURLINFO_PRETRANSFER_TIME: c_int = 3145734;
pub const CURLINFO_SIZE_UPLOAD: c_int = 3145735;
pub const CURLINFO_SIZE_UPLOAD_T: c_int = 6291463;
pub const CURLINFO_SIZE_DOWNLOAD: c_int = 3145736;
pub const CURLINFO_SIZE_DOWNLOAD_T: c_int = 6291464;
pub const CURLINFO_SPEED_DOWNLOAD: c_int = 3145737;
pub const CURLINFO_SPEED_DOWNLOAD_T: c_int = 6291465;
pub const CURLINFO_SPEED_UPLOAD: c_int = 3145738;
pub const CURLINFO_SPEED_UPLOAD_T: c_int = 6291466;
pub const CURLINFO_HEADER_SIZE: c_int = 2097163;
pub const CURLINFO_REQUEST_SIZE: c_int = 2097164;
pub const CURLINFO_SSL_VERIFYRESULT: c_int = 2097165;
pub const CURLINFO_FILETIME: c_int = 2097166;
pub const CURLINFO_FILETIME_T: c_int = 6291470;
pub const CURLINFO_CONTENT_LENGTH_DOWNLOAD: c_int = 3145743;
pub const CURLINFO_CONTENT_LENGTH_DOWNLOAD_T: c_int = 6291471;
pub const CURLINFO_CONTENT_LENGTH_UPLOAD: c_int = 3145744;
pub const CURLINFO_CONTENT_LENGTH_UPLOAD_T: c_int = 6291472;
pub const CURLINFO_STARTTRANSFER_TIME: c_int = 3145745;
pub const CURLINFO_CONTENT_TYPE: c_int = 1048594;
pub const CURLINFO_REDIRECT_TIME: c_int = 3145747;
pub const CURLINFO_REDIRECT_COUNT: c_int = 2097172;
pub const CURLINFO_PRIVATE: c_int = 1048597;
pub const CURLINFO_HTTP_CONNECTCODE: c_int = 2097174;
pub const CURLINFO_HTTPAUTH_AVAIL: c_int = 2097175;
pub const CURLINFO_PROXYAUTH_AVAIL: c_int = 2097176;
pub const CURLINFO_OS_ERRNO: c_int = 2097177;
pub const CURLINFO_NUM_CONNECTS: c_int = 2097178;
pub const CURLINFO_SSL_ENGINES: c_int = 4194331;
pub const CURLINFO_COOKIELIST: c_int = 4194332;
pub const CURLINFO_LASTSOCKET: c_int = 2097181;
pub const CURLINFO_FTP_ENTRY_PATH: c_int = 1048606;
pub const CURLINFO_REDIRECT_URL: c_int = 1048607;
pub const CURLINFO_PRIMARY_IP: c_int = 1048608;
pub const CURLINFO_APPCONNECT_TIME: c_int = 3145761;
pub const CURLINFO_CERTINFO: c_int = 4194338;
pub const CURLINFO_CONDITION_UNMET: c_int = 2097187;
pub const CURLINFO_RTSP_SESSION_ID: c_int = 1048612;
pub const CURLINFO_RTSP_CLIENT_CSEQ: c_int = 2097189;
pub const CURLINFO_RTSP_SERVER_CSEQ: c_int = 2097190;
pub const CURLINFO_RTSP_CSEQ_RECV: c_int = 2097191;
pub const CURLINFO_PRIMARY_PORT: c_int = 2097192;
pub const CURLINFO_LOCAL_IP: c_int = 1048617;
pub const CURLINFO_LOCAL_PORT: c_int = 2097194;
pub const CURLINFO_TLS_SESSION: c_int = 4194347;
pub const CURLINFO_ACTIVESOCKET: c_int = 5242924;
pub const CURLINFO_TLS_SSL_PTR: c_int = 4194349;
pub const CURLINFO_HTTP_VERSION: c_int = 2097198;
pub const CURLINFO_PROXY_SSL_VERIFYRESULT: c_int = 2097199;
pub const CURLINFO_PROTOCOL: c_int = 2097200;
pub const CURLINFO_SCHEME: c_int = 1048625;
pub const CURLINFO_TOTAL_TIME_T: c_int = 6291506;
pub const CURLINFO_NAMELOOKUP_TIME_T: c_int = 6291507;
pub const CURLINFO_CONNECT_TIME_T: c_int = 6291508;
pub const CURLINFO_PRETRANSFER_TIME_T: c_int = 6291509;
pub const CURLINFO_STARTTRANSFER_TIME_T: c_int = 6291510;
pub const CURLINFO_REDIRECT_TIME_T: c_int = 6291511;
pub const CURLINFO_APPCONNECT_TIME_T: c_int = 6291512;
pub const CURLINFO_RETRY_AFTER: c_int = 6291513;
pub const CURLINFO_EFFECTIVE_METHOD: c_int = 1048634;
pub const CURLINFO_PROXY_ERROR: c_int = 2097211;
pub const CURLINFO_REFERER: c_int = 1048636;
pub const CURLINFO_CAINFO: c_int = 1048637;
pub const CURLINFO_CAPATH: c_int = 1048638;
pub const CURLINFO_XFER_ID: c_int = 6291519;
pub const CURLINFO_CONN_ID: c_int = 6291520;
pub const CURLINFO_QUEUE_TIME_T: c_int = 6291521;
pub const CURLINFO_USED_PROXY: c_int = 2097218;
pub const CURLINFO_POSTTRANSFER_TIME_T: c_int = 6291523;
pub const CURLINFO_EARLYDATA_SENT_T: c_int = 6291524;
pub const CURLINFO_HTTPAUTH_USED: c_int = 2097221;
pub const CURLINFO_PROXYAUTH_USED: c_int = 2097222;
pub const CURLINFO_SIZE_DELIVERED: c_int = 6291527;
pub const CURLINFO_LASTONE: c_int = 71;
pub const CURLINFO = c_uint;
pub const CURLCLOSEPOLICY_NONE: c_int = 0;
pub const CURLCLOSEPOLICY_OLDEST: c_int = 1;
pub const CURLCLOSEPOLICY_LEAST_RECENTLY_USED: c_int = 2;
pub const CURLCLOSEPOLICY_LEAST_TRAFFIC: c_int = 3;
pub const CURLCLOSEPOLICY_SLOWEST: c_int = 4;
pub const CURLCLOSEPOLICY_CALLBACK: c_int = 5;
pub const CURLCLOSEPOLICY_LAST: c_int = 6;
pub const curl_closepolicy = c_uint;
pub const CURL_LOCK_DATA_NONE: c_int = 0;
pub const CURL_LOCK_DATA_SHARE: c_int = 1;
pub const CURL_LOCK_DATA_COOKIE: c_int = 2;
pub const CURL_LOCK_DATA_DNS: c_int = 3;
pub const CURL_LOCK_DATA_SSL_SESSION: c_int = 4;
pub const CURL_LOCK_DATA_CONNECT: c_int = 5;
pub const CURL_LOCK_DATA_PSL: c_int = 6;
pub const CURL_LOCK_DATA_HSTS: c_int = 7;
pub const CURL_LOCK_DATA_LAST: c_int = 8;
pub const curl_lock_data = c_uint;
pub const CURL_LOCK_ACCESS_NONE: c_int = 0;
pub const CURL_LOCK_ACCESS_SHARED: c_int = 1;
pub const CURL_LOCK_ACCESS_SINGLE: c_int = 2;
pub const CURL_LOCK_ACCESS_LAST: c_int = 3;
pub const curl_lock_access = c_uint;
pub const curl_lock_function = ?*const fn (handle: ?*CURL, data: curl_lock_data, locktype: curl_lock_access, userptr: ?*anyopaque) callconv(.c) void;
pub const curl_unlock_function = ?*const fn (handle: ?*CURL, data: curl_lock_data, userptr: ?*anyopaque) callconv(.c) void;
pub const CURLSHE_OK: c_int = 0;
pub const CURLSHE_BAD_OPTION: c_int = 1;
pub const CURLSHE_IN_USE: c_int = 2;
pub const CURLSHE_INVALID: c_int = 3;
pub const CURLSHE_NOMEM: c_int = 4;
pub const CURLSHE_NOT_BUILT_IN: c_int = 5;
pub const CURLSHE_LAST: c_int = 6;
pub const CURLSHcode = c_uint;
pub const CURLSHOPT_NONE: c_int = 0;
pub const CURLSHOPT_SHARE: c_int = 1;
pub const CURLSHOPT_UNSHARE: c_int = 2;
pub const CURLSHOPT_LOCKFUNC: c_int = 3;
pub const CURLSHOPT_UNLOCKFUNC: c_int = 4;
pub const CURLSHOPT_USERDATA: c_int = 5;
pub const CURLSHOPT_LAST: c_int = 6;
pub const CURLSHoption = c_uint;
pub extern fn curl_share_init() ?*CURLSH;
pub extern fn curl_share_setopt(sh: ?*CURLSH, option: CURLSHoption, ...) CURLSHcode;
pub extern fn curl_share_cleanup(sh: ?*CURLSH) CURLSHcode;
pub const CURLVERSION_FIRST: c_int = 0;
pub const CURLVERSION_SECOND: c_int = 1;
pub const CURLVERSION_THIRD: c_int = 2;
pub const CURLVERSION_FOURTH: c_int = 3;
pub const CURLVERSION_FIFTH: c_int = 4;
pub const CURLVERSION_SIXTH: c_int = 5;
pub const CURLVERSION_SEVENTH: c_int = 6;
pub const CURLVERSION_EIGHTH: c_int = 7;
pub const CURLVERSION_NINTH: c_int = 8;
pub const CURLVERSION_TENTH: c_int = 9;
pub const CURLVERSION_ELEVENTH: c_int = 10;
pub const CURLVERSION_TWELFTH: c_int = 11;
pub const CURLVERSION_LAST: c_int = 12;
pub const CURLversion = c_uint;
pub const struct_curl_version_info_data = extern struct {
    age: CURLversion = @import("std").mem.zeroes(CURLversion),
    version: [*c]const u8 = null,
    version_num: c_uint = 0,
    host: [*c]const u8 = null,
    features: c_int = 0,
    ssl_version: [*c]const u8 = null,
    ssl_version_num: c_long = 0,
    libz_version: [*c]const u8 = null,
    protocols: [*c]const [*c]const u8 = null,
    ares: [*c]const u8 = null,
    ares_num: c_int = 0,
    libidn: [*c]const u8 = null,
    iconv_ver_num: c_int = 0,
    libssh_version: [*c]const u8 = null,
    brotli_ver_num: c_uint = 0,
    brotli_version: [*c]const u8 = null,
    nghttp2_ver_num: c_uint = 0,
    nghttp2_version: [*c]const u8 = null,
    quic_version: [*c]const u8 = null,
    cainfo: [*c]const u8 = null,
    capath: [*c]const u8 = null,
    zstd_ver_num: c_uint = 0,
    zstd_version: [*c]const u8 = null,
    hyper_version: [*c]const u8 = null,
    gsasl_version: [*c]const u8 = null,
    feature_names: [*c]const [*c]const u8 = null,
    rtmp_version: [*c]const u8 = null,
};
pub const curl_version_info_data = struct_curl_version_info_data;
pub extern fn curl_version_info(stamp: CURLversion) [*c]curl_version_info_data;
pub extern fn curl_easy_strerror(@"error": CURLcode) [*c]const u8;
pub extern fn curl_share_strerror(@"error": CURLSHcode) [*c]const u8;
pub extern fn curl_easy_pause(curl: ?*CURL, action: c_int) CURLcode;
pub extern fn curl_easy_ssls_import(curl: ?*CURL, session_key: [*c]const u8, shmac: [*c]const u8, shmac_len: usize, sdata: [*c]const u8, sdata_len: usize) CURLcode;
pub const curl_ssls_export_cb = fn (curl: ?*CURL, userptr: ?*anyopaque, session_key: [*c]const u8, shmac: [*c]const u8, shmac_len: usize, sdata: [*c]const u8, sdata_len: usize, valid_until: curl_off_t, ietf_tls_id: c_int, alpn: [*c]const u8, earlydata_max: usize) callconv(.c) CURLcode;
pub extern fn curl_easy_ssls_export(curl: ?*CURL, export_fn: ?*const curl_ssls_export_cb, userptr: ?*anyopaque) CURLcode;
pub const struct_curl_blob = extern struct {
    data: ?*anyopaque = null,
    len: usize = 0,
    flags: c_uint = 0,
};
pub extern fn curl_easy_init() ?*CURL;
pub extern fn curl_easy_setopt(curl: ?*CURL, option: CURLoption, ...) CURLcode;
pub extern fn curl_easy_perform(curl: ?*CURL) CURLcode;
pub extern fn curl_easy_cleanup(curl: ?*CURL) void;
pub extern fn curl_easy_getinfo(curl: ?*CURL, info: CURLINFO, ...) CURLcode;
pub extern fn curl_easy_duphandle(curl: ?*CURL) ?*CURL;
pub extern fn curl_easy_reset(curl: ?*CURL) void;
pub extern fn curl_easy_recv(curl: ?*CURL, buffer: ?*anyopaque, buflen: usize, n: [*c]usize) CURLcode;
pub extern fn curl_easy_send(curl: ?*CURL, buffer: ?*const anyopaque, buflen: usize, n: [*c]usize) CURLcode;
pub extern fn curl_easy_upkeep(curl: ?*CURL) CURLcode;
pub const CURLM = anyopaque;
pub const CURLM_CALL_MULTI_PERFORM: c_int = -1;
pub const CURLM_OK: c_int = 0;
pub const CURLM_BAD_HANDLE: c_int = 1;
pub const CURLM_BAD_EASY_HANDLE: c_int = 2;
pub const CURLM_OUT_OF_MEMORY: c_int = 3;
pub const CURLM_INTERNAL_ERROR: c_int = 4;
pub const CURLM_BAD_SOCKET: c_int = 5;
pub const CURLM_UNKNOWN_OPTION: c_int = 6;
pub const CURLM_ADDED_ALREADY: c_int = 7;
pub const CURLM_RECURSIVE_API_CALL: c_int = 8;
pub const CURLM_WAKEUP_FAILURE: c_int = 9;
pub const CURLM_BAD_FUNCTION_ARGUMENT: c_int = 10;
pub const CURLM_ABORTED_BY_CALLBACK: c_int = 11;
pub const CURLM_UNRECOVERABLE_POLL: c_int = 12;
pub const CURLM_LAST: c_int = 13;
pub const CURLMcode = c_int;
pub const CURLMSG_NONE: c_int = 0;
pub const CURLMSG_DONE: c_int = 1;
pub const CURLMSG_LAST: c_int = 2;
pub const CURLMSG = c_uint;
const union_unnamed_9 = extern union {
    whatever: ?*anyopaque,
    result: CURLcode,
};
pub const struct_CURLMsg = extern struct {
    msg: CURLMSG = @import("std").mem.zeroes(CURLMSG),
    easy_handle: ?*CURL = null,
    data: union_unnamed_9 = @import("std").mem.zeroes(union_unnamed_9),
};
pub const CURLMsg = struct_CURLMsg;
pub const struct_curl_waitfd = extern struct {
    fd: curl_socket_t = 0,
    events: c_short = 0,
    revents: c_short = 0,
};
pub extern fn curl_multi_init() ?*CURLM;
pub extern fn curl_multi_add_handle(m: ?*CURLM, curl: ?*CURL) CURLMcode;
pub extern fn curl_multi_remove_handle(m: ?*CURLM, curl: ?*CURL) CURLMcode;
pub extern fn curl_multi_fdset(m: ?*CURLM, read_fd_set: [*c]fd_set, write_fd_set: [*c]fd_set, exc_fd_set: [*c]fd_set, max_fd: [*c]c_int) CURLMcode;
pub extern fn curl_multi_wait(m: ?*CURLM, extra_fds: [*c]struct_curl_waitfd, extra_nfds: c_uint, timeout_ms: c_int, ret: [*c]c_int) CURLMcode;
pub extern fn curl_multi_poll(m: ?*CURLM, extra_fds: [*c]struct_curl_waitfd, extra_nfds: c_uint, timeout_ms: c_int, ret: [*c]c_int) CURLMcode;
pub extern fn curl_multi_wakeup(m: ?*CURLM) CURLMcode;
pub extern fn curl_multi_perform(m: ?*CURLM, running_handles: [*c]c_int) CURLMcode;
pub extern fn curl_multi_cleanup(m: ?*CURLM) CURLMcode;
pub extern fn curl_multi_info_read(m: ?*CURLM, msgs_in_queue: [*c]c_int) [*c]CURLMsg;
pub extern fn curl_multi_strerror(@"error": CURLMcode) [*c]const u8;
pub const curl_socket_callback = ?*const fn (easy: ?*CURL, s: curl_socket_t, what: c_int, userp: ?*anyopaque, socketp: ?*anyopaque) callconv(.c) c_int;
pub const curl_multi_timer_callback = ?*const fn (m: ?*CURLM, timeout_ms: c_long, userp: ?*anyopaque) callconv(.c) c_int;
pub extern fn curl_multi_socket(m: ?*CURLM, s: curl_socket_t, running_handles: [*c]c_int) CURLMcode;
pub extern fn curl_multi_socket_action(m: ?*CURLM, s: curl_socket_t, ev_bitmask: c_int, running_handles: [*c]c_int) CURLMcode;
pub extern fn curl_multi_socket_all(m: ?*CURLM, running_handles: [*c]c_int) CURLMcode;
pub extern fn curl_multi_timeout(m: ?*CURLM, timeout_ms: [*c]c_long) CURLMcode;
pub const CURLMOPT_SOCKETFUNCTION: c_int = 20001;
pub const CURLMOPT_SOCKETDATA: c_int = 10002;
pub const CURLMOPT_PIPELINING: c_int = 3;
pub const CURLMOPT_TIMERFUNCTION: c_int = 20004;
pub const CURLMOPT_TIMERDATA: c_int = 10005;
pub const CURLMOPT_MAXCONNECTS: c_int = 6;
pub const CURLMOPT_MAX_HOST_CONNECTIONS: c_int = 7;
pub const CURLMOPT_MAX_PIPELINE_LENGTH: c_int = 8;
pub const CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE: c_int = 30009;
pub const CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE: c_int = 30010;
pub const CURLMOPT_PIPELINING_SITE_BL: c_int = 10011;
pub const CURLMOPT_PIPELINING_SERVER_BL: c_int = 10012;
pub const CURLMOPT_MAX_TOTAL_CONNECTIONS: c_int = 13;
pub const CURLMOPT_PUSHFUNCTION: c_int = 20014;
pub const CURLMOPT_PUSHDATA: c_int = 10015;
pub const CURLMOPT_MAX_CONCURRENT_STREAMS: c_int = 16;
pub const CURLMOPT_NETWORK_CHANGED: c_int = 17;
pub const CURLMOPT_NOTIFYFUNCTION: c_int = 20018;
pub const CURLMOPT_NOTIFYDATA: c_int = 10019;
pub const CURLMOPT_RESOLVE_THREADS_MAX: c_int = 20;
pub const CURLMOPT_QUICK_EXIT: c_int = 21;
pub const CURLMOPT_LASTENTRY: c_int = 22;
pub const CURLMoption = c_uint;
pub extern fn curl_multi_setopt(m: ?*CURLM, option: CURLMoption, ...) CURLMcode;
pub extern fn curl_multi_assign(m: ?*CURLM, sockfd: curl_socket_t, sockp: ?*anyopaque) CURLMcode;
pub extern fn curl_multi_get_handles(m: ?*CURLM) [*c]?*CURL;
pub const CURLMINFO_NONE: c_int = 0;
pub const CURLMINFO_XFERS_CURRENT: c_int = 1;
pub const CURLMINFO_XFERS_RUNNING: c_int = 2;
pub const CURLMINFO_XFERS_PENDING: c_int = 3;
pub const CURLMINFO_XFERS_DONE: c_int = 4;
pub const CURLMINFO_XFERS_ADDED: c_int = 5;
pub const CURLMINFO_LASTENTRY: c_int = 6;
pub const CURLMinfo_offt = c_uint;
pub extern fn curl_multi_get_offt(m: ?*CURLM, info: CURLMinfo_offt, pvalue: [*c]curl_off_t) CURLMcode;
pub const struct_curl_pushheaders = opaque {
    pub const curl_pushheader_bynum = __root.curl_pushheader_bynum;
    pub const curl_pushheader_byname = __root.curl_pushheader_byname;
    pub const bynum = __root.curl_pushheader_bynum;
    pub const byname = __root.curl_pushheader_byname;
};
pub extern fn curl_pushheader_bynum(h: ?*struct_curl_pushheaders, num: usize) [*c]u8;
pub extern fn curl_pushheader_byname(h: ?*struct_curl_pushheaders, name: [*c]const u8) [*c]u8;
pub const curl_push_callback = ?*const fn (parent: ?*CURL, easy: ?*CURL, num_headers: usize, headers: ?*struct_curl_pushheaders, userp: ?*anyopaque) callconv(.c) c_int;
pub extern fn curl_multi_waitfds(m: ?*CURLM, ufds: [*c]struct_curl_waitfd, size: c_uint, fd_count: [*c]c_uint) CURLMcode;
pub const curl_notify_callback = ?*const fn (m: ?*CURLM, notification: c_uint, easy: ?*CURL, user_data: ?*anyopaque) callconv(.c) void;
pub extern fn curl_multi_notify_disable(m: ?*CURLM, notification: c_uint) CURLMcode;
pub extern fn curl_multi_notify_enable(m: ?*CURLM, notification: c_uint) CURLMcode;
pub const CURLUE_OK: c_int = 0;
pub const CURLUE_BAD_HANDLE: c_int = 1;
pub const CURLUE_BAD_PARTPOINTER: c_int = 2;
pub const CURLUE_MALFORMED_INPUT: c_int = 3;
pub const CURLUE_BAD_PORT_NUMBER: c_int = 4;
pub const CURLUE_UNSUPPORTED_SCHEME: c_int = 5;
pub const CURLUE_URLDECODE: c_int = 6;
pub const CURLUE_OUT_OF_MEMORY: c_int = 7;
pub const CURLUE_USER_NOT_ALLOWED: c_int = 8;
pub const CURLUE_UNKNOWN_PART: c_int = 9;
pub const CURLUE_NO_SCHEME: c_int = 10;
pub const CURLUE_NO_USER: c_int = 11;
pub const CURLUE_NO_PASSWORD: c_int = 12;
pub const CURLUE_NO_OPTIONS: c_int = 13;
pub const CURLUE_NO_HOST: c_int = 14;
pub const CURLUE_NO_PORT: c_int = 15;
pub const CURLUE_NO_QUERY: c_int = 16;
pub const CURLUE_NO_FRAGMENT: c_int = 17;
pub const CURLUE_NO_ZONEID: c_int = 18;
pub const CURLUE_BAD_FILE_URL: c_int = 19;
pub const CURLUE_BAD_FRAGMENT: c_int = 20;
pub const CURLUE_BAD_HOSTNAME: c_int = 21;
pub const CURLUE_BAD_IPV6: c_int = 22;
pub const CURLUE_BAD_LOGIN: c_int = 23;
pub const CURLUE_BAD_PASSWORD: c_int = 24;
pub const CURLUE_BAD_PATH: c_int = 25;
pub const CURLUE_BAD_QUERY: c_int = 26;
pub const CURLUE_BAD_SCHEME: c_int = 27;
pub const CURLUE_BAD_SLASHES: c_int = 28;
pub const CURLUE_BAD_USER: c_int = 29;
pub const CURLUE_LACKS_IDN: c_int = 30;
pub const CURLUE_TOO_LARGE: c_int = 31;
pub const CURLUE_BACKSLASH: c_int = 32;
pub const CURLUE_LAST: c_int = 33;
pub const CURLUcode = c_uint;
pub const CURLUPART_URL: c_int = 0;
pub const CURLUPART_SCHEME: c_int = 1;
pub const CURLUPART_USER: c_int = 2;
pub const CURLUPART_PASSWORD: c_int = 3;
pub const CURLUPART_OPTIONS: c_int = 4;
pub const CURLUPART_HOST: c_int = 5;
pub const CURLUPART_PORT: c_int = 6;
pub const CURLUPART_PATH: c_int = 7;
pub const CURLUPART_QUERY: c_int = 8;
pub const CURLUPART_FRAGMENT: c_int = 9;
pub const CURLUPART_ZONEID: c_int = 10;
pub const CURLUPart = c_uint;
pub const struct_Curl_URL = opaque {
    pub const curl_url_cleanup = __root.curl_url_cleanup;
    pub const curl_url_dup = __root.curl_url_dup;
    pub const curl_url_get = __root.curl_url_get;
    pub const curl_url_set = __root.curl_url_set;
    pub const cleanup = __root.curl_url_cleanup;
    pub const dup = __root.curl_url_dup;
    pub const get = __root.curl_url_get;
    pub const set = __root.curl_url_set;
};
pub const CURLU = struct_Curl_URL;
pub extern fn curl_url() ?*CURLU;
pub extern fn curl_url_cleanup(u: ?*CURLU) void;
pub extern fn curl_url_dup(in: ?*const CURLU) ?*CURLU;
pub extern fn curl_url_get(u: ?*const CURLU, what: CURLUPart, part: [*c][*c]u8, flags: c_uint) CURLUcode;
pub extern fn curl_url_set(u: ?*CURLU, what: CURLUPart, part: [*c]const u8, flags: c_uint) CURLUcode;
pub extern fn curl_url_strerror(@"error": CURLUcode) [*c]const u8;
pub const CURLOT_LONG: c_int = 0;
pub const CURLOT_VALUES: c_int = 1;
pub const CURLOT_OFF_T: c_int = 2;
pub const CURLOT_OBJECT: c_int = 3;
pub const CURLOT_STRING: c_int = 4;
pub const CURLOT_SLIST: c_int = 5;
pub const CURLOT_CBPTR: c_int = 6;
pub const CURLOT_BLOB: c_int = 7;
pub const CURLOT_FUNCTION: c_int = 8;
pub const curl_easytype = c_uint;
pub const struct_curl_easyoption = extern struct {
    name: [*c]const u8 = null,
    id: CURLoption = @import("std").mem.zeroes(CURLoption),
    type: curl_easytype = @import("std").mem.zeroes(curl_easytype),
    flags: c_uint = 0,
    pub const curl_easy_option_next = __root.curl_easy_option_next;
    pub const next = __root.curl_easy_option_next;
};
pub extern fn curl_easy_option_by_name(name: [*c]const u8) [*c]const struct_curl_easyoption;
pub extern fn curl_easy_option_by_id(id: CURLoption) [*c]const struct_curl_easyoption;
pub extern fn curl_easy_option_next(prev: [*c]const struct_curl_easyoption) [*c]const struct_curl_easyoption;
pub const struct_curl_header = extern struct {
    name: [*c]u8 = null,
    value: [*c]u8 = null,
    amount: usize = 0,
    index: usize = 0,
    origin: c_uint = 0,
    anchor: ?*anyopaque = null,
};
pub const CURLHE_OK: c_int = 0;
pub const CURLHE_BADINDEX: c_int = 1;
pub const CURLHE_MISSING: c_int = 2;
pub const CURLHE_NOHEADERS: c_int = 3;
pub const CURLHE_NOREQUEST: c_int = 4;
pub const CURLHE_OUT_OF_MEMORY: c_int = 5;
pub const CURLHE_BAD_ARGUMENT: c_int = 6;
pub const CURLHE_NOT_BUILT_IN: c_int = 7;
pub const CURLHcode = c_uint;
pub extern fn curl_easy_header(curl: ?*CURL, name: [*c]const u8, nameindex: usize, origin: c_uint, request: c_int, hout: [*c][*c]struct_curl_header) CURLHcode;
pub extern fn curl_easy_nextheader(curl: ?*CURL, origin: c_uint, request: c_int, prev: [*c]struct_curl_header) [*c]struct_curl_header;
pub const struct_curl_ws_frame = extern struct {
    age: c_int = 0,
    flags: c_int = 0,
    offset: curl_off_t = 0,
    bytesleft: curl_off_t = 0,
    len: usize = 0,
};
pub extern fn curl_ws_recv(curl: ?*CURL, buffer: ?*anyopaque, buflen: usize, recv: [*c]usize, metap: [*c][*c]const struct_curl_ws_frame) CURLcode;
pub extern fn curl_ws_send(curl: ?*CURL, buffer_arg: ?*const anyopaque, buflen: usize, sent: [*c]usize, fragsize: curl_off_t, flags: c_uint) CURLcode;
pub extern fn curl_ws_start_frame(curl: ?*CURL, flags: c_uint, frame_len: curl_off_t) CURLcode;
pub extern fn curl_ws_meta(curl: ?*CURL) [*c]const struct_curl_ws_frame;
pub extern fn curl_mprintf(format: [*c]const u8, ...) c_int;
pub extern fn curl_mfprintf(fd: ?*FILE, format: [*c]const u8, ...) c_int;
pub extern fn curl_msprintf(buffer: [*c]u8, format: [*c]const u8, ...) c_int;
pub extern fn curl_msnprintf(buffer: [*c]u8, maxlength: usize, format: [*c]const u8, ...) c_int;
pub extern fn curl_mvprintf(format: [*c]const u8, args: [*c]struct___va_list_tag_5) c_int;
pub extern fn curl_mvfprintf(fd: ?*FILE, format: [*c]const u8, args: [*c]struct___va_list_tag_5) c_int;
pub extern fn curl_mvsprintf(buffer: [*c]u8, format: [*c]const u8, args: [*c]struct___va_list_tag_5) c_int;
pub extern fn curl_mvsnprintf(buffer: [*c]u8, maxlength: usize, format: [*c]const u8, args: [*c]struct___va_list_tag_5) c_int;
pub extern fn curl_maprintf(format: [*c]const u8, ...) [*c]u8;
pub extern fn curl_mvaprintf(format: [*c]const u8, args: [*c]struct___va_list_tag_5) [*c]u8; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:277:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_long() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:279:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_curl_off_t() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:281:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_cb_data() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:283:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_charpp() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:285:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_pushcb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:287:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_notifycb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:289:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_socketcb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:291:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_multi_setopt_err_timercb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:294:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_long() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:296:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curl_off_t() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:298:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_string() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:301:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_write_callback() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:303:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_resolver_start_callback() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:306:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_read_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:308:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_ioctl_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:310:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_sockopt_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:312:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_opensocket_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:315:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_progress_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:317:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_xferinfo_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:319:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_debug_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:321:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_ssl_ctx_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:323:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_conv_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:325:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_seek_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:327:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_cb_data() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:330:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_chunk_bgn_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:332:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_chunk_end_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:334:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_close_socket_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:336:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_fnmatch_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:338:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_hstsread_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:340:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_hstswrite_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:342:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_ssh_key_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:344:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_ssh_hostkey_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:346:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_interleave_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:348:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_prereq_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:350:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_trailer_cb() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:352:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_error_buffer() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:355:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curlu() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:357:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curl() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:359:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_FILE() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:361:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_postfields() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:363:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curl_httpost() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:366:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curl_mimepost() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:369:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_curl_slist() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:371:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_setopt_err_CURLSH() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:373:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_string() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:375:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_long() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:377:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_double() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:379:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_curl_slist() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:381:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_curl_tlssessioninfo() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:384:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_curl_certinfo() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:387:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_curl_socket() callconv(.c) void; // /usr/include/curl/typecheck-gcc.h:275:158: warning: TODO asm stmt
// /usr/include/curl/typecheck-gcc.h:389:13: warning: unable to translate function, demoted to extern
pub extern fn Wcurl_easy_getinfo_err_curl_off_t() callconv(.c) void;
pub const Wcurl_read_callback1 = ?*const fn ([*c]u8, usize, usize, ?*anyopaque) callconv(.c) usize;
pub const Wcurl_read_callback2 = ?*const fn ([*c]u8, usize, usize, ?*const anyopaque) callconv(.c) usize;
pub const Wcurl_read_callback3 = ?*const fn ([*c]u8, usize, usize, ?*FILE) callconv(.c) usize;
pub const Wcurl_read_callback4 = ?*const fn (?*anyopaque, usize, usize, ?*anyopaque) callconv(.c) usize;
pub const Wcurl_read_callback5 = ?*const fn (?*anyopaque, usize, usize, ?*const anyopaque) callconv(.c) usize;
pub const Wcurl_read_callback6 = ?*const fn (?*anyopaque, usize, usize, ?*FILE) callconv(.c) usize;
pub const Wcurl_write_callback1 = ?*const fn ([*c]const u8, usize, usize, ?*anyopaque) callconv(.c) usize;
pub const Wcurl_write_callback2 = ?*const fn ([*c]const u8, usize, usize, ?*const anyopaque) callconv(.c) usize;
pub const Wcurl_write_callback3 = ?*const fn ([*c]const u8, usize, usize, ?*FILE) callconv(.c) usize;
pub const Wcurl_write_callback4 = ?*const fn (?*const anyopaque, usize, usize, ?*anyopaque) callconv(.c) usize;
pub const Wcurl_write_callback5 = ?*const fn (?*const anyopaque, usize, usize, ?*const anyopaque) callconv(.c) usize;
pub const Wcurl_write_callback6 = ?*const fn (?*const anyopaque, usize, usize, ?*FILE) callconv(.c) usize;
pub const Wcurl_ioctl_callback1 = ?*const fn (?*CURL, c_int, ?*anyopaque) callconv(.c) curlioerr;
pub const Wcurl_ioctl_callback2 = ?*const fn (?*CURL, c_int, ?*const anyopaque) callconv(.c) curlioerr;
pub const Wcurl_ioctl_callback3 = ?*const fn (?*CURL, curliocmd, ?*anyopaque) callconv(.c) curlioerr;
pub const Wcurl_ioctl_callback4 = ?*const fn (?*CURL, curliocmd, ?*const anyopaque) callconv(.c) curlioerr;
pub const Wcurl_sockopt_callback1 = ?*const fn (?*anyopaque, curl_socket_t, curlsocktype) callconv(.c) c_int;
pub const Wcurl_sockopt_callback2 = ?*const fn (?*const anyopaque, curl_socket_t, curlsocktype) callconv(.c) c_int;
pub const Wcurl_opensocket_callback1 = ?*const fn (?*anyopaque, curlsocktype, [*c]struct_curl_sockaddr) callconv(.c) curl_socket_t;
pub const Wcurl_opensocket_callback2 = ?*const fn (?*anyopaque, curlsocktype, [*c]const struct_curl_sockaddr) callconv(.c) curl_socket_t;
pub const Wcurl_opensocket_callback3 = ?*const fn (?*const anyopaque, curlsocktype, [*c]struct_curl_sockaddr) callconv(.c) curl_socket_t;
pub const Wcurl_opensocket_callback4 = ?*const fn (?*const anyopaque, curlsocktype, [*c]const struct_curl_sockaddr) callconv(.c) curl_socket_t;
pub const Wcurl_progress_callback1 = ?*const fn (?*anyopaque, f64, f64, f64, f64) callconv(.c) c_int;
pub const Wcurl_progress_callback2 = ?*const fn (?*const anyopaque, f64, f64, f64, f64) callconv(.c) c_int;
pub const Wcurl_debug_callback1 = ?*const fn (?*CURL, curl_infotype, [*c]u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback2 = ?*const fn (?*CURL, curl_infotype, [*c]u8, usize, ?*const anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback3 = ?*const fn (?*CURL, curl_infotype, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback4 = ?*const fn (?*CURL, curl_infotype, [*c]const u8, usize, ?*const anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback5 = ?*const fn (?*CURL, curl_infotype, [*c]u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback6 = ?*const fn (?*CURL, curl_infotype, [*c]u8, usize, ?*const anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback7 = ?*const fn (?*CURL, curl_infotype, [*c]const u8, usize, ?*anyopaque) callconv(.c) c_int;
pub const Wcurl_debug_callback8 = ?*const fn (?*CURL, curl_infotype, [*c]const u8, usize, ?*const anyopaque) callconv(.c) c_int;
pub const Wcurl_ssl_ctx_callback1 = ?*const fn (?*CURL, ?*anyopaque, ?*anyopaque) callconv(.c) CURLcode;
pub const Wcurl_ssl_ctx_callback2 = ?*const fn (?*CURL, ?*anyopaque, ?*const anyopaque) callconv(.c) CURLcode;
pub const Wcurl_ssl_ctx_callback3 = ?*const fn (?*CURL, ?*const anyopaque, ?*anyopaque) callconv(.c) CURLcode;
pub const Wcurl_ssl_ctx_callback4 = ?*const fn (?*CURL, ?*const anyopaque, ?*const anyopaque) callconv(.c) CURLcode;
pub const Wcurl_ssl_ctx_callback5 = Wcurl_ssl_ctx_callback1;
pub const Wcurl_ssl_ctx_callback6 = Wcurl_ssl_ctx_callback1;
pub const Wcurl_ssl_ctx_callback7 = Wcurl_ssl_ctx_callback1;
pub const Wcurl_ssl_ctx_callback8 = Wcurl_ssl_ctx_callback1;
pub const Wcurl_conv_callback1 = ?*const fn ([*c]u8, length: usize) callconv(.c) CURLcode;
pub const Wcurl_conv_callback2 = ?*const fn ([*c]const u8, length: usize) callconv(.c) CURLcode;
pub const Wcurl_conv_callback3 = ?*const fn (?*anyopaque, length: usize) callconv(.c) CURLcode;
pub const Wcurl_conv_callback4 = ?*const fn (?*const anyopaque, length: usize) callconv(.c) CURLcode;
pub const Wcurl_seek_callback1 = ?*const fn (?*anyopaque, curl_off_t, c_int) callconv(.c) CURLcode;
pub const Wcurl_seek_callback2 = ?*const fn (?*const anyopaque, curl_off_t, c_int) callconv(.c) CURLcode;
pub const Wcurl_chunk_bgn_callback1 = ?*const fn ([*c]struct_curl_fileinfo, ?*anyopaque, c_int) callconv(.c) c_long;
pub const Wcurl_chunk_bgn_callback2 = ?*const fn (?*anyopaque, ?*anyopaque, c_int) callconv(.c) c_long;
pub const Wcurl_interleave_callback1 = ?*const fn (p: ?*anyopaque, s: usize, n: usize, u: ?*anyopaque) callconv(.c) usize;
pub const Wcurl_interleave_callback2 = ?*const fn (p: [*c]u8, s: usize, n: usize, u: ?*anyopaque) callconv(.c) usize;

pub const __VERSION__ = "Aro aro-zig";
pub const __Aro__ = "";
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __GNUC__ = @as(c_int, 7);
pub const __GNUC_MINOR__ = @as(c_int, 1);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 0);
pub const __ARO_EMULATE_NO__ = @as(c_int, 0);
pub const __ARO_EMULATE_CLANG__ = @as(c_int, 1);
pub const __ARO_EMULATE_GCC__ = @as(c_int, 2);
pub const __ARO_EMULATE_MSVC__ = @as(c_int, 3);
pub const __ARO_EMULATE__ = __ARO_EMULATE_GCC__;
pub inline fn __building_module(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:33:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`"); // <builtin>:34:9
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __ATOMIC_BOOL_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_WINT_T_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_SHORT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_INT_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_LLONG_LOCK_FREE = @as(c_int, 1);
pub const __ATOMIC_POINTER_LOCK_FREE = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SCHAR_WIDTH__ = @as(c_int, 8);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __LONG_LONG_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIG_ATOMIC_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __BITINT_MAXWIDTH__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 10);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTPTR_TYPE__ = c_long;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // <builtin>:152:9
pub const __INTMAX_C = __helpers.L_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // <builtin>:155:9
pub const __UINTMAX_C = __helpers.UL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_long;
pub const __SIZE_TYPE__ = c_ulong;
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // <builtin>:181:9
pub const __INT64_C = __helpers.L_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // <builtin>:206:9
pub const __UINT32_C = __helpers.U_SUFFIX;
pub const __UINT32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // <builtin>:215:9
pub const __UINT64_C = __helpers.UL_SUFFIX;
pub const __UINT64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const INT_LEAST8_FMTd__ = "hhd";
pub const INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const UINT_LEAST8_FMTo__ = "hho";
pub const UINT_LEAST8_FMTu__ = "hhu";
pub const UINT_LEAST8_FMTx__ = "hhx";
pub const UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const INT_FAST8_FMTd__ = "hhd";
pub const INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const UINT_FAST8_FMTo__ = "hho";
pub const UINT_FAST8_FMTu__ = "hhu";
pub const UINT_FAST8_FMTx__ = "hhx";
pub const UINT_FAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const INT_LEAST16_FMTd__ = "hd";
pub const INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST16_FMTo__ = "ho";
pub const UINT_LEAST16_FMTu__ = "hu";
pub const UINT_LEAST16_FMTx__ = "hx";
pub const UINT_LEAST16_FMTX__ = "hX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const INT_FAST16_FMTd__ = "hd";
pub const INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = __helpers.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_FAST16_FMTo__ = "ho";
pub const UINT_FAST16_FMTu__ = "hu";
pub const UINT_FAST16_FMTx__ = "hx";
pub const UINT_FAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const INT_LEAST32_FMTd__ = "d";
pub const INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST32_FMTo__ = "o";
pub const UINT_LEAST32_FMTu__ = "u";
pub const UINT_LEAST32_FMTx__ = "x";
pub const UINT_LEAST32_FMTX__ = "X";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const INT_FAST32_FMTd__ = "d";
pub const INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_FAST32_FMTo__ = "o";
pub const UINT_FAST32_FMTu__ = "u";
pub const UINT_FAST32_FMTx__ = "x";
pub const UINT_FAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const INT_LEAST64_FMTd__ = "ld";
pub const INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_LEAST64_FMTo__ = "lo";
pub const UINT_LEAST64_FMTu__ = "lu";
pub const UINT_LEAST64_FMTx__ = "lx";
pub const UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const INT_FAST64_FMTd__ = "ld";
pub const INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = __helpers.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_FMTo__ = "lo";
pub const UINT_FAST64_FMTu__ = "lu";
pub const UINT_FAST64_FMTx__ = "lx";
pub const UINT_FAST64_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_HAS_DENORM__ = "";
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = "";
pub const __FLT16_HAS_QUIET_NAN__ = "";
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = "";
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = "";
pub const __FLT_HAS_QUIET_NAN__ = "";
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = "";
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = "";
pub const __DBL_HAS_QUIET_NAN__ = "";
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = "";
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = "";
pub const __LDBL_HAS_QUIET_NAN__ = "";
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __pic__ = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 44);
pub const COMMON_H = "";
pub const CURLINC_CURL_H = "";
pub inline fn CURL_DEPRECATED(version: anytype, message: anytype) void {
    _ = &version;
    _ = &message;
    return;
}
pub inline fn CURL_IGNORE_DEPRECATION(statements: anytype) @TypeOf(statements) {
    _ = &statements;
    return statements;
}
pub const CURLINC_CURLVER_H = "";
pub const LIBCURL_COPYRIGHT = "Daniel Stenberg, <daniel@haxx.se>.";
pub const LIBCURL_VERSION = "8.22.0";
pub const LIBCURL_VERSION_MAJOR = @as(c_int, 8);
pub const LIBCURL_VERSION_MINOR = @as(c_int, 22);
pub const LIBCURL_VERSION_PATCH = @as(c_int, 0);
pub const LIBCURL_VERSION_NUM = __helpers.promoteIntLiteral(c_int, 0x081600, .hex);
pub const LIBCURL_TIMESTAMP = "2026-09-02";
pub inline fn CURL_VERSION_BITS(x: anytype, y: anytype, z: anytype) @TypeOf(((x << @as(c_int, 16)) | (y << @as(c_int, 8))) | z) {
    _ = &x;
    _ = &y;
    _ = &z;
    return ((x << @as(c_int, 16)) | (y << @as(c_int, 8))) | z;
}
pub inline fn CURL_AT_LEAST_VERSION(x: anytype, y: anytype, z: anytype) @TypeOf(LIBCURL_VERSION_NUM >= CURL_VERSION_BITS(x, y, z)) {
    _ = &x;
    _ = &y;
    _ = &z;
    return LIBCURL_VERSION_NUM >= CURL_VERSION_BITS(x, y, z);
}
pub const CURLINC_SYSTEM_H = "";
pub const CURL_TYPEOF_CURL_OFF_T = c_long;
pub const CURL_FORMAT_CURL_OFF_T = "ld";
pub const CURL_FORMAT_CURL_OFF_TU = "lu";
pub const CURL_SUFFIX_CURL_OFF_T = @compileError("unable to translate macro: undefined identifier `L`"); // /usr/include/curl/system.h:343:13
pub const CURL_SUFFIX_CURL_OFF_TU = @compileError("unable to translate macro: undefined identifier `UL`"); // /usr/include/curl/system.h:344:13
pub const CURL_POPCOUNT64 = @compileError("unable to translate macro: undefined identifier `__builtin_popcountl`"); // /usr/include/curl/system.h:347:15
pub const CURL_CTZ64 = @compileError("unable to translate macro: undefined identifier `__builtin_ctzl`"); // /usr/include/curl/system.h:348:15
pub const CURL_TYPEOF_CURL_SOCKLEN_T = socklen_t;
pub const CURL_PULL_SYS_TYPES_H = @as(c_int, 1);
pub const CURL_PULL_SYS_SOCKET_H = @as(c_int, 1);
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &maj;
    _ = &min;
    return @as(c_int, 0);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`"); // /usr/include/features.h:197:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2Y = @as(c_int, 0);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 202405);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __USE_XOPEN2K24 = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /usr/include/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__builtin.has_builtin(name)) {
    _ = &name;
    return __builtin.has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`"); // /usr/include/sys/cdefs.h:55:10
pub const __LEAF = @compileError("unable to translate macro: undefined identifier `__leaf__`"); // /usr/include/sys/cdefs.h:65:11
pub const __LEAF_ATTR = @compileError("unable to translate macro: undefined identifier `__leaf__`"); // /usr/include/sys/cdefs.h:66:11
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`"); // /usr/include/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`"); // /usr/include/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /usr/include/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token ''"); // /usr/include/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin.object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin.object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin.object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate macro: undefined identifier `__warning__`"); // /usr/include/sys/cdefs.h:366:10
pub const __errordecl = @compileError("unable to translate macro: undefined identifier `__error__`"); // /usr/include/sys/cdefs.h:367:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['"); // /usr/include/sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include/sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include/sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'"); // /usr/include/sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate macro: undefined identifier `__USER_LABEL_PREFIX__`"); // /usr/include/sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`"); // /usr/include/sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate macro: undefined identifier `__alloc_size__`"); // /usr/include/sys/cdefs.h:460:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`"); // /usr/include/sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`"); // /usr/include/sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'"); // /usr/include/sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`"); // /usr/include/sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`"); // /usr/include/sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`"); // /usr/include/sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /usr/include/sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`"); // /usr/include/sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`"); // /usr/include/sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`"); // /usr/include/sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`"); // /usr/include/sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`"); // /usr/include/sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`"); // /usr/include/sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`"); // /usr/include/sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`"); // /usr/include/sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/sys/cdefs.h:626:11
pub const __extern_always_inline = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/sys/cdefs.h:627:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __va_arg_pack = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack`"); // /usr/include/sys/cdefs.h:638:10
pub const __va_arg_pack_len = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg_pack_len`"); // /usr/include/sys/cdefs.h:639:10
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'"); // /usr/include/sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin.expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin.expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub inline fn __attribute_copy__(arg: anytype) void {
    _ = &arg;
    return;
}
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR2_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __LDBL_REDIR_DECL(name: anytype) void {
    _ = &name;
    return;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /usr/include/sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`"); // /usr/include/sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __glibc_const_generic = @compileError("unable to translate C expr: expected type instead got 'const'"); // /usr/include/sys/cdefs.h:837:10
pub inline fn __fortified_attr_access(a: anytype, o: anytype, s: anytype) void {
    _ = &a;
    _ = &o;
    _ = &s;
    return;
}
pub inline fn __attr_access(x: anytype) void {
    _ = &x;
    return;
}
pub inline fn __attr_access_none(argno: anytype) void {
    _ = &argno;
    return;
}
pub inline fn __attr_dealloc(dealloc: anytype, argno: anytype) void {
    _ = &dealloc;
    _ = &argno;
    return;
}
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`"); // /usr/include/sys/cdefs.h:884:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`"); // /usr/include/sys/cdefs.h:893:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`"); // /usr/include/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __off_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const __need_size_t = "";
pub const __STDC_VERSION_STDDEF_H__ = @as(c_long, 202311);
pub const NULL = __helpers.cast(?*anyopaque, @as(c_int, 0));
pub const offsetof = @compileError("unable to translate macro: undefined identifier `__builtin_offsetof`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stddef.h:18:9
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return __helpers.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & __helpers.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & __helpers.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & __helpers.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & __helpers.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`"); // /usr/include/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='"); // /usr/include/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='"); // /usr/include/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = __helpers.div(@as(c_int, 1024), @as(c_int, 8) * __helpers.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * __helpers.cast(c_int, __helpers.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(__helpers.div(d, __NFDBITS)) {
    _ = &d;
    return __helpers.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return __helpers.cast(__fd_mask, @as(c_ulong, 1) << __helpers.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    _ = &set;
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/bits/struct_mutex.h:55:10
pub const _RWLOCK_INTERNAL_H = "";
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/bits/thread-shared-types.h:114:9
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _SYS_SOCKET_H = @as(c_int, 1);
pub const __iovec_defined = @as(c_int, 1);
pub const __BITS_SOCKET_H = "";
pub const __socklen_t_defined = "";
pub const PF_UNSPEC = @as(c_int, 0);
pub const PF_LOCAL = @as(c_int, 1);
pub const PF_UNIX = PF_LOCAL;
pub const PF_FILE = PF_LOCAL;
pub const PF_INET = @as(c_int, 2);
pub const PF_AX25 = @as(c_int, 3);
pub const PF_IPX = @as(c_int, 4);
pub const PF_APPLETALK = @as(c_int, 5);
pub const PF_NETROM = @as(c_int, 6);
pub const PF_BRIDGE = @as(c_int, 7);
pub const PF_ATMPVC = @as(c_int, 8);
pub const PF_X25 = @as(c_int, 9);
pub const PF_INET6 = @as(c_int, 10);
pub const PF_ROSE = @as(c_int, 11);
pub const PF_DECnet = @as(c_int, 12);
pub const PF_NETBEUI = @as(c_int, 13);
pub const PF_SECURITY = @as(c_int, 14);
pub const PF_KEY = @as(c_int, 15);
pub const PF_NETLINK = @as(c_int, 16);
pub const PF_ROUTE = PF_NETLINK;
pub const PF_PACKET = @as(c_int, 17);
pub const PF_ASH = @as(c_int, 18);
pub const PF_ECONET = @as(c_int, 19);
pub const PF_ATMSVC = @as(c_int, 20);
pub const PF_RDS = @as(c_int, 21);
pub const PF_SNA = @as(c_int, 22);
pub const PF_IRDA = @as(c_int, 23);
pub const PF_PPPOX = @as(c_int, 24);
pub const PF_WANPIPE = @as(c_int, 25);
pub const PF_LLC = @as(c_int, 26);
pub const PF_IB = @as(c_int, 27);
pub const PF_MPLS = @as(c_int, 28);
pub const PF_CAN = @as(c_int, 29);
pub const PF_TIPC = @as(c_int, 30);
pub const PF_BLUETOOTH = @as(c_int, 31);
pub const PF_IUCV = @as(c_int, 32);
pub const PF_RXRPC = @as(c_int, 33);
pub const PF_ISDN = @as(c_int, 34);
pub const PF_PHONET = @as(c_int, 35);
pub const PF_IEEE802154 = @as(c_int, 36);
pub const PF_CAIF = @as(c_int, 37);
pub const PF_ALG = @as(c_int, 38);
pub const PF_NFC = @as(c_int, 39);
pub const PF_VSOCK = @as(c_int, 40);
pub const PF_KCM = @as(c_int, 41);
pub const PF_QIPCRTR = @as(c_int, 42);
pub const PF_SMC = @as(c_int, 43);
pub const PF_XDP = @as(c_int, 44);
pub const PF_MCTP = @as(c_int, 45);
pub const PF_MAX = @as(c_int, 46);
pub const AF_UNSPEC = PF_UNSPEC;
pub const AF_LOCAL = PF_LOCAL;
pub const AF_UNIX = PF_UNIX;
pub const AF_FILE = PF_FILE;
pub const AF_INET = PF_INET;
pub const AF_AX25 = PF_AX25;
pub const AF_IPX = PF_IPX;
pub const AF_APPLETALK = PF_APPLETALK;
pub const AF_NETROM = PF_NETROM;
pub const AF_BRIDGE = PF_BRIDGE;
pub const AF_ATMPVC = PF_ATMPVC;
pub const AF_X25 = PF_X25;
pub const AF_INET6 = PF_INET6;
pub const AF_ROSE = PF_ROSE;
pub const AF_DECnet = PF_DECnet;
pub const AF_NETBEUI = PF_NETBEUI;
pub const AF_SECURITY = PF_SECURITY;
pub const AF_KEY = PF_KEY;
pub const AF_NETLINK = PF_NETLINK;
pub const AF_ROUTE = PF_ROUTE;
pub const AF_PACKET = PF_PACKET;
pub const AF_ASH = PF_ASH;
pub const AF_ECONET = PF_ECONET;
pub const AF_ATMSVC = PF_ATMSVC;
pub const AF_RDS = PF_RDS;
pub const AF_SNA = PF_SNA;
pub const AF_IRDA = PF_IRDA;
pub const AF_PPPOX = PF_PPPOX;
pub const AF_WANPIPE = PF_WANPIPE;
pub const AF_LLC = PF_LLC;
pub const AF_IB = PF_IB;
pub const AF_MPLS = PF_MPLS;
pub const AF_CAN = PF_CAN;
pub const AF_TIPC = PF_TIPC;
pub const AF_BLUETOOTH = PF_BLUETOOTH;
pub const AF_IUCV = PF_IUCV;
pub const AF_RXRPC = PF_RXRPC;
pub const AF_ISDN = PF_ISDN;
pub const AF_PHONET = PF_PHONET;
pub const AF_IEEE802154 = PF_IEEE802154;
pub const AF_CAIF = PF_CAIF;
pub const AF_ALG = PF_ALG;
pub const AF_NFC = PF_NFC;
pub const AF_VSOCK = PF_VSOCK;
pub const AF_KCM = PF_KCM;
pub const AF_QIPCRTR = PF_QIPCRTR;
pub const AF_SMC = PF_SMC;
pub const AF_XDP = PF_XDP;
pub const AF_MCTP = PF_MCTP;
pub const AF_MAX = PF_MAX;
pub const SOL_RAW = @as(c_int, 255);
pub const SOL_DECNET = @as(c_int, 261);
pub const SOL_X25 = @as(c_int, 262);
pub const SOL_PACKET = @as(c_int, 263);
pub const SOL_ATM = @as(c_int, 264);
pub const SOL_AAL = @as(c_int, 265);
pub const SOL_IRDA = @as(c_int, 266);
pub const SOL_NETBEUI = @as(c_int, 267);
pub const SOL_LLC = @as(c_int, 268);
pub const SOL_DCCP = @as(c_int, 269);
pub const SOL_NETLINK = @as(c_int, 270);
pub const SOL_TIPC = @as(c_int, 271);
pub const SOL_RXRPC = @as(c_int, 272);
pub const SOL_PPPOL2TP = @as(c_int, 273);
pub const SOL_BLUETOOTH = @as(c_int, 274);
pub const SOL_PNPIPE = @as(c_int, 275);
pub const SOL_RDS = @as(c_int, 276);
pub const SOL_IUCV = @as(c_int, 277);
pub const SOL_CAIF = @as(c_int, 278);
pub const SOL_ALG = @as(c_int, 279);
pub const SOL_NFC = @as(c_int, 280);
pub const SOL_KCM = @as(c_int, 281);
pub const SOL_TLS = @as(c_int, 282);
pub const SOL_XDP = @as(c_int, 283);
pub const SOL_MPTCP = @as(c_int, 284);
pub const SOL_MCTP = @as(c_int, 285);
pub const SOL_SMC = @as(c_int, 286);
pub const SOL_VSOCK = @as(c_int, 287);
pub const SOMAXCONN = @as(c_int, 4096);
pub const _BITS_SOCKADDR_H = @as(c_int, 1);
pub const __SOCKADDR_COMMON = @compileError("unable to translate macro: undefined identifier `family`"); // /usr/include/bits/sockaddr.h:34:9
pub const __SOCKADDR_COMMON_SIZE = __helpers.sizeof(c_ushort);
pub const _SS_SIZE = @as(c_int, 128);
pub const __ss_aligntype = c_ulong;
pub const _SS_PADSIZE = (_SS_SIZE - __SOCKADDR_COMMON_SIZE) - __helpers.sizeof(__ss_aligntype);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(cmsg.*.__cmsg_data) {
    _ = &cmsg;
    return cmsg.*.__cmsg_data;
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(__cmsg_nxthdr(mhdr, cmsg)) {
    _ = &mhdr;
    _ = &cmsg;
    return __cmsg_nxthdr(mhdr, cmsg);
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (__helpers.cast(bool, __helpers.cast(usize, mhdr.*.msg_controllen) >= __helpers.sizeof(struct_cmsghdr))) __helpers.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else __helpers.cast([*c]struct_cmsghdr, @as(c_int, 0))) {
    _ = &mhdr;
    return if (__helpers.cast(bool, __helpers.cast(usize, mhdr.*.msg_controllen) >= __helpers.sizeof(struct_cmsghdr))) __helpers.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else __helpers.cast([*c]struct_cmsghdr, @as(c_int, 0));
}
pub inline fn CMSG_ALIGN(len: anytype) @TypeOf(((len + __helpers.sizeof(usize)) - @as(c_int, 1)) & __helpers.cast(usize, ~(__helpers.sizeof(usize) - @as(c_int, 1)))) {
    _ = &len;
    return ((len + __helpers.sizeof(usize)) - @as(c_int, 1)) & __helpers.cast(usize, ~(__helpers.sizeof(usize) - @as(c_int, 1)));
}
pub inline fn CMSG_SPACE(len: anytype) @TypeOf(CMSG_ALIGN(len) + CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr))) {
    _ = &len;
    return CMSG_ALIGN(len) + CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_LEN(len: anytype) @TypeOf(CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr)) + len) {
    _ = &len;
    return CMSG_ALIGN(__helpers.sizeof(struct_cmsghdr)) + len;
}
pub inline fn __CMSG_PADDING(len: anytype) @TypeOf((__helpers.sizeof(usize) - (len & (__helpers.sizeof(usize) - @as(c_int, 1)))) & (__helpers.sizeof(usize) - @as(c_int, 1))) {
    _ = &len;
    return (__helpers.sizeof(usize) - (len & (__helpers.sizeof(usize) - @as(c_int, 1)))) & (__helpers.sizeof(usize) - @as(c_int, 1));
}
pub const __ASM_GENERIC_SOCKET_H = "";
pub const _LINUX_POSIX_TYPES_H = "";
pub const _LINUX_STDDEF_H = "";
pub inline fn __struct_group_tag(TAG: anytype) @TypeOf(TAG) {
    _ = &TAG;
    return TAG;
}
pub const __struct_group = @compileError("unable to translate C expr: unexpected token 'union'"); // /usr/include/linux/stddef.h:32:9
pub const __DECLARE_FLEX_ARRAY = @compileError("unable to translate macro: undefined identifier `__empty_`"); // /usr/include/linux/stddef.h:53:9
pub inline fn __counted_by(m: anytype) void {
    _ = &m;
    return;
}
pub inline fn __counted_by_le(m: anytype) void {
    _ = &m;
    return;
}
pub inline fn __counted_by_be(m: anytype) void {
    _ = &m;
    return;
}
pub inline fn __counted_by_ptr(m: anytype) void {
    _ = &m;
    return;
}
pub const __kernel_nonstring = "";
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _ASM_X86_POSIX_TYPES_64_H = "";
pub const __ASM_GENERIC_POSIX_TYPES_H = "";
pub const __ASM_X86_BITSPERLONG_H = "";
pub const __BITS_PER_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_BITS_PER_LONG = "";
pub const __BITS_PER_LONG_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_SOCKIOS_H = "";
pub const FIOSETOWN = __helpers.promoteIntLiteral(c_int, 0x8901, .hex);
pub const SIOCSPGRP = __helpers.promoteIntLiteral(c_int, 0x8902, .hex);
pub const FIOGETOWN = __helpers.promoteIntLiteral(c_int, 0x8903, .hex);
pub const SIOCGPGRP = __helpers.promoteIntLiteral(c_int, 0x8904, .hex);
pub const SIOCATMARK = __helpers.promoteIntLiteral(c_int, 0x8905, .hex);
pub const SIOCGSTAMP_OLD = __helpers.promoteIntLiteral(c_int, 0x8906, .hex);
pub const SIOCGSTAMPNS_OLD = __helpers.promoteIntLiteral(c_int, 0x8907, .hex);
pub const SOL_SOCKET = @as(c_int, 1);
pub const SO_DEBUG = @as(c_int, 1);
pub const SO_REUSEADDR = @as(c_int, 2);
pub const SO_TYPE = @as(c_int, 3);
pub const SO_ERROR = @as(c_int, 4);
pub const SO_DONTROUTE = @as(c_int, 5);
pub const SO_BROADCAST = @as(c_int, 6);
pub const SO_SNDBUF = @as(c_int, 7);
pub const SO_RCVBUF = @as(c_int, 8);
pub const SO_SNDBUFFORCE = @as(c_int, 32);
pub const SO_RCVBUFFORCE = @as(c_int, 33);
pub const SO_KEEPALIVE = @as(c_int, 9);
pub const SO_OOBINLINE = @as(c_int, 10);
pub const SO_NO_CHECK = @as(c_int, 11);
pub const SO_PRIORITY = @as(c_int, 12);
pub const SO_LINGER = @as(c_int, 13);
pub const SO_BSDCOMPAT = @as(c_int, 14);
pub const SO_REUSEPORT = @as(c_int, 15);
pub const SO_PASSCRED = @as(c_int, 16);
pub const SO_PEERCRED = @as(c_int, 17);
pub const SO_RCVLOWAT = @as(c_int, 18);
pub const SO_SNDLOWAT = @as(c_int, 19);
pub const SO_RCVTIMEO_OLD = @as(c_int, 20);
pub const SO_SNDTIMEO_OLD = @as(c_int, 21);
pub const SO_SECURITY_AUTHENTICATION = @as(c_int, 22);
pub const SO_SECURITY_ENCRYPTION_TRANSPORT = @as(c_int, 23);
pub const SO_SECURITY_ENCRYPTION_NETWORK = @as(c_int, 24);
pub const SO_BINDTODEVICE = @as(c_int, 25);
pub const SO_ATTACH_FILTER = @as(c_int, 26);
pub const SO_DETACH_FILTER = @as(c_int, 27);
pub const SO_GET_FILTER = SO_ATTACH_FILTER;
pub const SO_PEERNAME = @as(c_int, 28);
pub const SO_ACCEPTCONN = @as(c_int, 30);
pub const SO_PEERSEC = @as(c_int, 31);
pub const SO_PASSSEC = @as(c_int, 34);
pub const SO_MARK = @as(c_int, 36);
pub const SO_PROTOCOL = @as(c_int, 38);
pub const SO_DOMAIN = @as(c_int, 39);
pub const SO_RXQ_OVFL = @as(c_int, 40);
pub const SO_WIFI_STATUS = @as(c_int, 41);
pub const SCM_WIFI_STATUS = SO_WIFI_STATUS;
pub const SO_PEEK_OFF = @as(c_int, 42);
pub const SO_NOFCS = @as(c_int, 43);
pub const SO_LOCK_FILTER = @as(c_int, 44);
pub const SO_SELECT_ERR_QUEUE = @as(c_int, 45);
pub const SO_BUSY_POLL = @as(c_int, 46);
pub const SO_MAX_PACING_RATE = @as(c_int, 47);
pub const SO_BPF_EXTENSIONS = @as(c_int, 48);
pub const SO_INCOMING_CPU = @as(c_int, 49);
pub const SO_ATTACH_BPF = @as(c_int, 50);
pub const SO_DETACH_BPF = SO_DETACH_FILTER;
pub const SO_ATTACH_REUSEPORT_CBPF = @as(c_int, 51);
pub const SO_ATTACH_REUSEPORT_EBPF = @as(c_int, 52);
pub const SO_CNX_ADVICE = @as(c_int, 53);
pub const SCM_TIMESTAMPING_OPT_STATS = @as(c_int, 54);
pub const SO_MEMINFO = @as(c_int, 55);
pub const SO_INCOMING_NAPI_ID = @as(c_int, 56);
pub const SO_COOKIE = @as(c_int, 57);
pub const SCM_TIMESTAMPING_PKTINFO = @as(c_int, 58);
pub const SO_PEERGROUPS = @as(c_int, 59);
pub const SO_ZEROCOPY = @as(c_int, 60);
pub const SO_TXTIME = @as(c_int, 61);
pub const SCM_TXTIME = SO_TXTIME;
pub const SO_BINDTOIFINDEX = @as(c_int, 62);
pub const SO_TIMESTAMP_OLD = @as(c_int, 29);
pub const SO_TIMESTAMPNS_OLD = @as(c_int, 35);
pub const SO_TIMESTAMPING_OLD = @as(c_int, 37);
pub const SO_TIMESTAMP_NEW = @as(c_int, 63);
pub const SO_TIMESTAMPNS_NEW = @as(c_int, 64);
pub const SO_TIMESTAMPING_NEW = @as(c_int, 65);
pub const SO_RCVTIMEO_NEW = @as(c_int, 66);
pub const SO_SNDTIMEO_NEW = @as(c_int, 67);
pub const SO_DETACH_REUSEPORT_BPF = @as(c_int, 68);
pub const SO_PREFER_BUSY_POLL = @as(c_int, 69);
pub const SO_BUSY_POLL_BUDGET = @as(c_int, 70);
pub const SO_NETNS_COOKIE = @as(c_int, 71);
pub const SO_BUF_LOCK = @as(c_int, 72);
pub const SO_RESERVE_MEM = @as(c_int, 73);
pub const SO_TXREHASH = @as(c_int, 74);
pub const SO_RCVMARK = @as(c_int, 75);
pub const SO_PASSPIDFD = @as(c_int, 76);
pub const SO_PEERPIDFD = @as(c_int, 77);
pub const SO_DEVMEM_LINEAR = @as(c_int, 78);
pub const SCM_DEVMEM_LINEAR = SO_DEVMEM_LINEAR;
pub const SO_DEVMEM_DMABUF = @as(c_int, 79);
pub const SCM_DEVMEM_DMABUF = SO_DEVMEM_DMABUF;
pub const SO_DEVMEM_DONTNEED = @as(c_int, 80);
pub const SCM_TS_OPT_ID = @as(c_int, 81);
pub const SO_RCVPRIORITY = @as(c_int, 82);
pub const SO_PASSRIGHTS = @as(c_int, 83);
pub const SO_INQ = @as(c_int, 84);
pub const SCM_INQ = SO_INQ;
pub const SO_TIMESTAMP = SO_TIMESTAMP_OLD;
pub const SO_TIMESTAMPNS = SO_TIMESTAMPNS_OLD;
pub const SO_TIMESTAMPING = SO_TIMESTAMPING_OLD;
pub const SO_RCVTIMEO = SO_RCVTIMEO_OLD;
pub const SO_SNDTIMEO = SO_SNDTIMEO_OLD;
pub const SCM_TIMESTAMP = SO_TIMESTAMP;
pub const SCM_TIMESTAMPNS = SO_TIMESTAMPNS;
pub const SCM_TIMESTAMPING = SO_TIMESTAMPING;
pub const __osockaddr_defined = @as(c_int, 1);
pub const __SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token '__restrict'"); // /usr/include/sys/socket.h:58:10
pub const __CONST_SOCKADDR_ARG = @compileError("unable to translate C expr: unexpected token 'const'"); // /usr/include/sys/socket.h:59:10
pub const _STDIO_H = @as(c_int, 1);
pub const __need_NULL = "";
pub const __need___va_list = "";
pub const __STDC_VERSION_STDARG_H__ = @as(c_int, 0);
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stdarg.h:12:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stdarg.h:14:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stdarg.h:15:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stdarg.h:18:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /home/duck/.zvm/master/lib/compiler/aro/include/stdarg.h:22:9
pub const __GNUC_VA_LIST = @as(c_int, 1);
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include/bits/types/struct_FILE.h:113:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include/bits/types/struct_FILE.h:117:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = __helpers.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = __helpers.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 1);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 1);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const __f128 = @compileError("unable to translate macro: undefined identifier `f128`"); // /usr/include/bits/floatn.h:72:12
pub const __CFLOAT128 = @compileError("unable to translate: invalid numeric type"); // /usr/include/bits/floatn.h:86:12
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 1);
pub const __f32 = @compileError("unable to translate macro: undefined identifier `f32`"); // /usr/include/bits/floatn-common.h:93:12
pub const __f64 = @compileError("unable to translate macro: undefined identifier `f64`"); // /usr/include/bits/floatn-common.h:105:12
pub const __f32x = @compileError("unable to translate macro: undefined identifier `f32x`"); // /usr/include/bits/floatn-common.h:113:12
pub const __f64x = @compileError("unable to translate macro: undefined identifier `f64x`"); // /usr/include/bits/floatn-common.h:125:12
pub const __CFLOAT32 = @compileError("unable to translate: invalid numeric type"); // /usr/include/bits/floatn-common.h:151:12
pub const __CFLOAT64 = @compileError("unable to translate: invalid numeric type"); // /usr/include/bits/floatn-common.h:163:12
pub const __CFLOAT32X = @compileError("unable to translate: invalid numeric type"); // /usr/include/bits/floatn-common.h:171:12
pub const __CFLOAT64X = @compileError("unable to translate: invalid numeric type"); // /usr/include/bits/floatn-common.h:183:12
pub const _GCC_LIMITS_H_ = "";
pub const __CLANG_LIMITS_H = "";
pub const _LIBC_LIMITS_H_ = @as(c_int, 1);
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const MB_LEN_MAX = @as(c_int, 16);
pub const _BITS_POSIX1_LIM_H = @as(c_int, 1);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX_CLOCKRES_MIN = __helpers.promoteIntLiteral(c_int, 20000000, .decimal);
pub const _LINUX_LIMITS_H = "";
pub const NGROUPS_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const MAX_CANON = @as(c_int, 255);
pub const MAX_INPUT = @as(c_int, 255);
pub const NAME_MAX = @as(c_int, 255);
pub const PATH_MAX = @as(c_int, 4096);
pub const PIPE_BUF = @as(c_int, 4096);
pub const XATTR_NAME_MAX = @as(c_int, 255);
pub const XATTR_SIZE_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const XATTR_LIST_MAX = __helpers.promoteIntLiteral(c_int, 65536, .decimal);
pub const RTSIG_MAX = @as(c_int, 32);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const PTHREAD_KEYS_MAX = @as(c_int, 1024);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = _POSIX_THREAD_DESTRUCTOR_ITERATIONS;
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const AIO_PRIO_DELTA_MAX = @as(c_int, 20);
pub const PTHREAD_STACK_MIN = @as(c_int, 16384);
pub const DELAYTIMER_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const TTY_NAME_MAX = @as(c_int, 32);
pub const LOGIN_NAME_MAX = @as(c_int, 256);
pub const HOST_NAME_MAX = @as(c_int, 64);
pub const MQ_PRIO_MAX = __helpers.promoteIntLiteral(c_int, 32768, .decimal);
pub const SEM_VALUE_MAX = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SSIZE_MAX = LONG_MAX;
pub const _BITS_POSIX2_LIM_H = @as(c_int, 1);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const BC_BASE_MAX = _POSIX2_BC_BASE_MAX;
pub const BC_DIM_MAX = _POSIX2_BC_DIM_MAX;
pub const BC_SCALE_MAX = _POSIX2_BC_SCALE_MAX;
pub const BC_STRING_MAX = _POSIX2_BC_STRING_MAX;
pub const COLL_WEIGHTS_MAX = @as(c_int, 255);
pub const EXPR_NEST_MAX = _POSIX2_EXPR_NEST_MAX;
pub const LINE_MAX = _POSIX2_LINE_MAX;
pub const CHARCLASS_NAME_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 0x7fff);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const LLONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _TIME_H = @as(c_int, 1);
pub const _BITS_TIME_H = @as(c_int, 1);
pub const CLOCKS_PER_SEC = __helpers.cast(__clock_t, __helpers.promoteIntLiteral(c_int, 1000000, .decimal));
pub const CLOCK_REALTIME = @as(c_int, 0);
pub const CLOCK_MONOTONIC = @as(c_int, 1);
pub const CLOCK_PROCESS_CPUTIME_ID = @as(c_int, 2);
pub const CLOCK_THREAD_CPUTIME_ID = @as(c_int, 3);
pub const CLOCK_MONOTONIC_RAW = @as(c_int, 4);
pub const CLOCK_REALTIME_COARSE = @as(c_int, 5);
pub const CLOCK_MONOTONIC_COARSE = @as(c_int, 6);
pub const CLOCK_BOOTTIME = @as(c_int, 7);
pub const CLOCK_REALTIME_ALARM = @as(c_int, 8);
pub const CLOCK_BOOTTIME_ALARM = @as(c_int, 9);
pub const CLOCK_TAI = @as(c_int, 11);
pub const TIMER_ABSTIME = @as(c_int, 1);
pub const __struct_tm_defined = @as(c_int, 1);
pub const __itimerspec_defined = @as(c_int, 1);
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const TIME_UTC = @as(c_int, 1);
pub inline fn __isleap(year: anytype) @TypeOf((__helpers.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((__helpers.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (__helpers.rem(year, @as(c_int, 400)) == @as(c_int, 0)))) {
    _ = &year;
    return (__helpers.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((__helpers.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (__helpers.rem(year, @as(c_int, 400)) == @as(c_int, 0)));
}
pub const _SYS_TIME_H = @as(c_int, 1);
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub const timerclear = @compileError("unable to translate C expr: expected ')' instead got '='"); // /usr/include/sys/time.h:232:10
pub inline fn timercmp(a: anytype, b: anytype, CMP: anytype) @TypeOf(if (__helpers.cast(bool, a.*.tv_sec == b.*.tv_sec)) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec) {
    _ = &a;
    _ = &b;
    _ = &CMP;
    return if (__helpers.cast(bool, a.*.tv_sec == b.*.tv_sec)) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'"); // /usr/include/sys/time.h:237:10
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'"); // /usr/include/sys/time.h:247:10
pub const CURL_HAS_DECLSPEC_ATTRIBUTE = @compileError("unable to translate macro: undefined identifier `__has_declspec_attribute`"); // /usr/include/curl/curl.h:119:9
pub const CURL_EXTERN = "";
pub const CURL_SOCKET_BAD = -@as(c_int, 1);
pub const curl_socket_typedef = "";
pub const CURLSSLBACKEND_AWSLC = CURLSSLBACKEND_OPENSSL;
pub const CURLSSLBACKEND_BORINGSSL = CURLSSLBACKEND_OPENSSL;
pub const CURLSSLBACKEND_LIBRESSL = CURLSSLBACKEND_OPENSSL;
pub const CURLSSLBACKEND_CYASSL = CURLSSLBACKEND_WOLFSSL;
pub const CURLSSLBACKEND_DARWINSSL = CURLSSLBACKEND_SECURETRANSPORT;
pub const CURLFOLLOW_ALL = @as(c_long, 1);
pub const CURLFOLLOW_OBEYCODE = @as(c_long, 2);
pub const CURLFOLLOW_FIRSTONLY = @as(c_long, 3);
pub const CURL_HTTPPOST_FILENAME = @as(c_int, 1) << @as(c_int, 0);
pub const CURL_HTTPPOST_READFILE = @as(c_int, 1) << @as(c_int, 1);
pub const CURL_HTTPPOST_PTRNAME = @as(c_int, 1) << @as(c_int, 2);
pub const CURL_HTTPPOST_PTRCONTENTS = @as(c_int, 1) << @as(c_int, 3);
pub const CURL_HTTPPOST_BUFFER = @as(c_int, 1) << @as(c_int, 4);
pub const CURL_HTTPPOST_PTRBUFFER = @as(c_int, 1) << @as(c_int, 5);
pub const CURL_HTTPPOST_CALLBACK = @as(c_int, 1) << @as(c_int, 6);
pub const CURL_HTTPPOST_LARGE = @as(c_int, 1) << @as(c_int, 7);
pub const CURL_PROGRESSFUNC_CONTINUE = __helpers.promoteIntLiteral(c_int, 0x10000001, .hex);
pub const CURL_MAX_READ_SIZE = (@as(c_int, 10) * @as(c_int, 1024)) * @as(c_int, 1024);
pub const CURL_MAX_WRITE_SIZE = @as(c_int, 16384);
pub const CURL_MAX_HTTP_HEADER = @as(c_int, 100) * @as(c_int, 1024);
pub const CURL_WRITEFUNC_PAUSE = __helpers.promoteIntLiteral(c_int, 0x10000001, .hex);
pub const CURL_WRITEFUNC_ERROR = __helpers.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const CURLFINFOFLAG_KNOWN_FILENAME = @as(c_int, 1) << @as(c_int, 0);
pub const CURLFINFOFLAG_KNOWN_FILETYPE = @as(c_int, 1) << @as(c_int, 1);
pub const CURLFINFOFLAG_KNOWN_TIME = @as(c_int, 1) << @as(c_int, 2);
pub const CURLFINFOFLAG_KNOWN_PERM = @as(c_int, 1) << @as(c_int, 3);
pub const CURLFINFOFLAG_KNOWN_UID = @as(c_int, 1) << @as(c_int, 4);
pub const CURLFINFOFLAG_KNOWN_GID = @as(c_int, 1) << @as(c_int, 5);
pub const CURLFINFOFLAG_KNOWN_SIZE = @as(c_int, 1) << @as(c_int, 6);
pub const CURLFINFOFLAG_KNOWN_HLINKCOUNT = @as(c_int, 1) << @as(c_int, 7);
pub const CURL_CHUNK_BGN_FUNC_OK = @as(c_int, 0);
pub const CURL_CHUNK_BGN_FUNC_FAIL = @as(c_int, 1);
pub const CURL_CHUNK_BGN_FUNC_SKIP = @as(c_int, 2);
pub const CURL_CHUNK_END_FUNC_OK = @as(c_int, 0);
pub const CURL_CHUNK_END_FUNC_FAIL = @as(c_int, 1);
pub const CURL_FNMATCHFUNC_MATCH = @as(c_int, 0);
pub const CURL_FNMATCHFUNC_NOMATCH = @as(c_int, 1);
pub const CURL_FNMATCHFUNC_FAIL = @as(c_int, 2);
pub const CURL_SEEKFUNC_OK = @as(c_int, 0);
pub const CURL_SEEKFUNC_FAIL = @as(c_int, 1);
pub const CURL_SEEKFUNC_CANTSEEK = @as(c_int, 2);
pub const CURL_READFUNC_ABORT = __helpers.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const CURL_READFUNC_PAUSE = __helpers.promoteIntLiteral(c_int, 0x10000001, .hex);
pub const CURL_TRAILERFUNC_OK = @as(c_int, 0);
pub const CURL_TRAILERFUNC_ABORT = @as(c_int, 1);
pub const CURL_SOCKOPT_OK = @as(c_int, 0);
pub const CURL_SOCKOPT_ERROR = @as(c_int, 1);
pub const CURL_SOCKOPT_ALREADY_CONNECTED = @as(c_int, 2);
pub const CURL_DID_MEMORY_FUNC_TYPEDEFS = "";
pub const CURL_PREREQFUNC_OK = @as(c_int, 0);
pub const CURL_PREREQFUNC_ABORT = @as(c_int, 1);
pub const CURLE_FUNCTION_NOT_FOUND = CURLE_OBSOLETE41;
pub const CURLE_HTTP_POST_ERROR = CURLE_OBSOLETE34;
pub const CURLE_OBSOLETE16 = CURLE_HTTP2;
pub const CURLE_OBSOLETE10 = CURLE_FTP_ACCEPT_FAILED;
pub const CURLE_OBSOLETE12 = CURLE_FTP_ACCEPT_TIMEOUT;
pub const CURLOPT_ENCODING = CURLOPT_ACCEPT_ENCODING;
pub const CURLE_FTP_WEIRD_SERVER_REPLY = CURLE_WEIRD_SERVER_REPLY;
pub const CURLE_SSL_CACERT = CURLE_PEER_FAILED_VERIFICATION;
pub const CURLE_UNKNOWN_TELNET_OPTION = CURLE_UNKNOWN_OPTION;
pub const CURLE_TELNET_OPTION_SYNTAX = CURLE_SETOPT_OPTION_SYNTAX;
pub const CURLE_SSL_PEER_CERTIFICATE = CURLE_PEER_FAILED_VERIFICATION;
pub const CURLE_OBSOLETE = CURLE_OBSOLETE50;
pub const CURLE_BAD_PASSWORD_ENTERED = CURLE_OBSOLETE46;
pub const CURLE_BAD_CALLING_ORDER = CURLE_OBSOLETE44;
pub const CURLE_FTP_USER_PASSWORD_INCORRECT = CURLE_OBSOLETE10;
pub const CURLE_FTP_CANT_RECONNECT = CURLE_OBSOLETE16;
pub const CURLE_FTP_COULDNT_GET_SIZE = CURLE_OBSOLETE32;
pub const CURLE_FTP_COULDNT_SET_ASCII = CURLE_OBSOLETE29;
pub const CURLE_FTP_WEIRD_USER_REPLY = CURLE_OBSOLETE12;
pub const CURLE_FTP_WRITE_ERROR = CURLE_OBSOLETE20;
pub const CURLE_LIBRARY_NOT_FOUND = CURLE_OBSOLETE40;
pub const CURLE_MALFORMAT_USER = CURLE_OBSOLETE24;
pub const CURLE_SHARE_IN_USE = CURLE_OBSOLETE57;
pub const CURLE_URL_MALFORMAT_USER = CURLE_NOT_BUILT_IN;
pub const CURLE_FTP_ACCESS_DENIED = CURLE_REMOTE_ACCESS_DENIED;
pub const CURLE_FTP_COULDNT_SET_BINARY = CURLE_FTP_COULDNT_SET_TYPE;
pub const CURLE_FTP_QUOTE_ERROR = CURLE_QUOTE_ERROR;
pub const CURLE_TFTP_DISKFULL = CURLE_REMOTE_DISK_FULL;
pub const CURLE_TFTP_EXISTS = CURLE_REMOTE_FILE_EXISTS;
pub const CURLE_HTTP_RANGE_ERROR = CURLE_RANGE_ERROR;
pub const CURLE_FTP_SSL_FAILED = CURLE_USE_SSL_FAILED;
pub const CURLE_OPERATION_TIMEOUTED = CURLE_OPERATION_TIMEDOUT;
pub const CURLE_HTTP_NOT_FOUND = CURLE_HTTP_RETURNED_ERROR;
pub const CURLE_HTTP_PORT_FAILED = CURLE_INTERFACE_FAILED;
pub const CURLE_FTP_COULDNT_STOR_FILE = CURLE_UPLOAD_FAILED;
pub const CURLE_FTP_PARTIAL_FILE = CURLE_PARTIAL_FILE;
pub const CURLE_FTP_BAD_DOWNLOAD_RESUME = CURLE_BAD_DOWNLOAD_RESUME;
pub const CURLE_LDAP_INVALID_URL = CURLE_OBSOLETE62;
pub const CURLE_CONV_REQD = CURLE_OBSOLETE76;
pub const CURLE_CONV_FAILED = CURLE_OBSOLETE75;
pub const CURLE_ALREADY_COMPLETE = __helpers.promoteIntLiteral(c_int, 99999, .decimal);
pub const CURLOPT_FILE = CURLOPT_WRITEDATA;
pub const CURLOPT_INFILE = CURLOPT_READDATA;
pub const CURLOPT_WRITEHEADER = CURLOPT_HEADERDATA;
pub const CURLOPT_WRITEINFO = CURLOPT_OBSOLETE40;
pub const CURLOPT_CLOSEPOLICY = CURLOPT_OBSOLETE72;
pub const CURLOPT_OBSOLETE72 = @as(c_int, 9999);
pub const CURLOPT_OBSOLETE40 = @as(c_int, 9999);
pub const CURLPROXY_HTTP = @as(c_long, 0);
pub const CURLPROXY_HTTP_1_0 = @as(c_long, 1);
pub const CURLPROXY_HTTPS = @as(c_long, 2);
pub const CURLPROXY_HTTPS2 = @as(c_long, 3);
pub const CURLPROXY_SOCKS4 = @as(c_long, 4);
pub const CURLPROXY_SOCKS5 = @as(c_long, 5);
pub const CURLPROXY_SOCKS4A = @as(c_long, 6);
pub const CURLPROXY_SOCKS5_HOSTNAME = @as(c_long, 7);
pub const CURLPROXY_HTTPS3 = @as(c_long, 8);
pub const CURLAUTH_NONE = __helpers.cast(c_ulong, @as(c_int, 0));
pub const CURLAUTH_BASIC = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 0);
pub const CURLAUTH_DIGEST = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 1);
pub const CURLAUTH_NEGOTIATE = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 2);
pub const CURLAUTH_GSSNEGOTIATE = CURLAUTH_NEGOTIATE;
pub const CURLAUTH_GSSAPI = CURLAUTH_NEGOTIATE;
pub const CURLAUTH_NTLM = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 3);
pub const CURLAUTH_DIGEST_IE = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 4);
pub const CURLAUTH_NTLM_WB = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 5);
pub const CURLAUTH_BEARER = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 6);
pub const CURLAUTH_AWS_SIGV4 = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 7);
pub const CURLAUTH_HTTPSIG = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 8);
pub const CURLAUTH_ONLY = __helpers.cast(c_ulong, @as(c_int, 1)) << @as(c_int, 31);
pub const CURLAUTH_ANY = ~(CURLAUTH_DIGEST_IE | CURLAUTH_HTTPSIG) & __helpers.cast(c_ulong, __helpers.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const CURLAUTH_ANYSAFE = ~((CURLAUTH_BASIC | CURLAUTH_DIGEST_IE) | CURLAUTH_HTTPSIG) & __helpers.cast(c_ulong, __helpers.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const CURLHTTPSIG_NONE = @as(c_long, 0);
pub const CURLHTTPSIG_ED25519 = @as(c_long, 1);
pub const CURLHTTPSIG_HMAC_SHA256 = @as(c_long, 2);
pub const CURLSSH_AUTH_ANY = __helpers.cast(c_ulong, __helpers.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const CURLSSH_AUTH_NONE = @as(c_long, 0);
pub const CURLSSH_AUTH_PUBLICKEY = @as(c_long, 1) << @as(c_int, 0);
pub const CURLSSH_AUTH_PASSWORD = @as(c_long, 1) << @as(c_int, 1);
pub const CURLSSH_AUTH_HOST = @as(c_long, 1) << @as(c_int, 2);
pub const CURLSSH_AUTH_KEYBOARD = @as(c_long, 1) << @as(c_int, 3);
pub const CURLSSH_AUTH_AGENT = @as(c_long, 1) << @as(c_int, 4);
pub const CURLSSH_AUTH_GSSAPI = @as(c_long, 1) << @as(c_int, 5);
pub const CURLSSH_AUTH_DEFAULT = CURLSSH_AUTH_ANY;
pub const CURLGSSAPI_DELEGATION_NONE = @as(c_long, 0);
pub const CURLGSSAPI_DELEGATION_POLICY_FLAG = @as(c_long, 1) << @as(c_int, 0);
pub const CURLGSSAPI_DELEGATION_FLAG = @as(c_long, 1) << @as(c_int, 1);
pub const CURL_ERROR_SIZE = @as(c_int, 256);
pub const CURLUSESSL_NONE = @as(c_long, 0);
pub const CURLUSESSL_TRY = @as(c_long, 1);
pub const CURLUSESSL_CONTROL = @as(c_long, 2);
pub const CURLUSESSL_ALL = @as(c_long, 3);
pub const CURLSSLOPT_ALLOW_BEAST = @as(c_long, 1) << @as(c_int, 0);
pub const CURLSSLOPT_NO_REVOKE = @as(c_long, 1) << @as(c_int, 1);
pub const CURLSSLOPT_NO_PARTIALCHAIN = @as(c_long, 1) << @as(c_int, 2);
pub const CURLSSLOPT_REVOKE_BEST_EFFORT = @as(c_long, 1) << @as(c_int, 3);
pub const CURLSSLOPT_NATIVE_CA = @as(c_long, 1) << @as(c_int, 4);
pub const CURLSSLOPT_AUTO_CLIENT_CERT = @as(c_long, 1) << @as(c_int, 5);
pub const CURLSSLOPT_EARLYDATA = @as(c_long, 1) << @as(c_int, 6);
pub const CURL_HET_DEFAULT = @as(c_long, 200);
pub const CURL_UPKEEP_INTERVAL_DEFAULT = @as(c_long, 60000);
pub const CURLFTPSSL_NONE = CURLUSESSL_NONE;
pub const CURLFTPSSL_TRY = CURLUSESSL_TRY;
pub const CURLFTPSSL_CONTROL = CURLUSESSL_CONTROL;
pub const CURLFTPSSL_ALL = CURLUSESSL_ALL;
pub const CURLFTPSSL_LAST = CURLUSESSL_LAST;
pub const curl_ftpssl = curl_usessl;
pub const CURLFTPSSL_CCC_NONE = @as(c_long, 0);
pub const CURLFTPSSL_CCC_PASSIVE = @as(c_long, 1);
pub const CURLFTPSSL_CCC_ACTIVE = @as(c_long, 2);
pub const CURLFTPAUTH_DEFAULT = @as(c_long, 0);
pub const CURLFTPAUTH_SSL = @as(c_long, 1);
pub const CURLFTPAUTH_TLS = @as(c_long, 2);
pub const CURLFTP_CREATE_DIR_NONE = @as(c_long, 0);
pub const CURLFTP_CREATE_DIR = @as(c_long, 1);
pub const CURLFTP_CREATE_DIR_RETRY = @as(c_long, 2);
pub const CURLFTPMETHOD_DEFAULT = @as(c_long, 0);
pub const CURLFTPMETHOD_MULTICWD = @as(c_long, 1);
pub const CURLFTPMETHOD_NOCWD = @as(c_long, 2);
pub const CURLFTPMETHOD_SINGLECWD = @as(c_long, 3);
pub const CURLHEADER_UNIFIED = @as(c_long, 0);
pub const CURLHEADER_SEPARATE = @as(c_long, 1) << @as(c_int, 0);
pub const CURLALTSVC_READONLYFILE = @as(c_long, 1) << @as(c_int, 2);
pub const CURLALTSVC_H1 = @as(c_long, 1) << @as(c_int, 3);
pub const CURLALTSVC_H2 = @as(c_long, 1) << @as(c_int, 4);
pub const CURLALTSVC_H3 = @as(c_long, 1) << @as(c_int, 5);
pub const CURLULFLAG_ANSWERED = @as(c_long, 1) << @as(c_int, 0);
pub const CURLULFLAG_DELETED = @as(c_long, 1) << @as(c_int, 1);
pub const CURLULFLAG_DRAFT = @as(c_long, 1) << @as(c_int, 2);
pub const CURLULFLAG_FLAGGED = @as(c_long, 1) << @as(c_int, 3);
pub const CURLULFLAG_SEEN = @as(c_long, 1) << @as(c_int, 4);
pub const CURLHSTS_ENABLE = @as(c_long, 1) << @as(c_int, 0);
pub const CURLHSTS_READONLYFILE = @as(c_long, 1) << @as(c_int, 1);
pub const CURLPROTO_HTTP = @as(c_long, 1) << @as(c_int, 0);
pub const CURLPROTO_HTTPS = @as(c_long, 1) << @as(c_int, 1);
pub const CURLPROTO_FTP = @as(c_long, 1) << @as(c_int, 2);
pub const CURLPROTO_FTPS = @as(c_long, 1) << @as(c_int, 3);
pub const CURLPROTO_SCP = @as(c_long, 1) << @as(c_int, 4);
pub const CURLPROTO_SFTP = @as(c_long, 1) << @as(c_int, 5);
pub const CURLPROTO_TELNET = @as(c_long, 1) << @as(c_int, 6);
pub const CURLPROTO_LDAP = @as(c_long, 1) << @as(c_int, 7);
pub const CURLPROTO_LDAPS = @as(c_long, 1) << @as(c_int, 8);
pub const CURLPROTO_DICT = @as(c_long, 1) << @as(c_int, 9);
pub const CURLPROTO_FILE = @as(c_long, 1) << @as(c_int, 10);
pub const CURLPROTO_TFTP = @as(c_long, 1) << @as(c_int, 11);
pub const CURLPROTO_IMAP = @as(c_long, 1) << @as(c_int, 12);
pub const CURLPROTO_IMAPS = @as(c_long, 1) << @as(c_int, 13);
pub const CURLPROTO_POP3 = @as(c_long, 1) << @as(c_int, 14);
pub const CURLPROTO_POP3S = @as(c_long, 1) << @as(c_int, 15);
pub const CURLPROTO_SMTP = @as(c_long, 1) << @as(c_int, 16);
pub const CURLPROTO_SMTPS = @as(c_long, 1) << @as(c_int, 17);
pub const CURLPROTO_RTSP = @as(c_long, 1) << @as(c_int, 18);
pub const CURLPROTO_RTMP = @as(c_long, 1) << @as(c_int, 19);
pub const CURLPROTO_RTMPT = @as(c_long, 1) << @as(c_int, 20);
pub const CURLPROTO_RTMPE = @as(c_long, 1) << @as(c_int, 21);
pub const CURLPROTO_RTMPTE = @as(c_long, 1) << @as(c_int, 22);
pub const CURLPROTO_RTMPS = @as(c_long, 1) << @as(c_int, 23);
pub const CURLPROTO_RTMPTS = @as(c_long, 1) << @as(c_int, 24);
pub const CURLPROTO_GOPHER = @as(c_long, 1) << @as(c_int, 25);
pub const CURLPROTO_SMB = @as(c_long, 1) << @as(c_int, 26);
pub const CURLPROTO_SMBS = @as(c_long, 1) << @as(c_int, 27);
pub const CURLPROTO_MQTT = @as(c_long, 1) << @as(c_int, 28);
pub const CURLPROTO_GOPHERS = @as(c_long, 1) << @as(c_int, 29);
pub const CURLPROTO_ALL = __helpers.cast(c_ulong, __helpers.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const CURLOPTTYPE_LONG = @as(c_int, 0);
pub const CURLOPTTYPE_OBJECTPOINT = @as(c_int, 10000);
pub const CURLOPTTYPE_FUNCTIONPOINT = @as(c_int, 20000);
pub const CURLOPTTYPE_OFF_T = @as(c_int, 30000);
pub const CURLOPTTYPE_BLOB = __helpers.promoteIntLiteral(c_int, 40000, .decimal);
pub const CURLOPT = @compileError("unable to translate C expr: unexpected token '='"); // /usr/include/curl/curl.h:1132:9
pub const CURLOPTDEPRECATED = @compileError("unable to translate C expr: unexpected token '='"); // /usr/include/curl/curl.h:1133:9
pub const CURLOPTTYPE_STRINGPOINT = CURLOPTTYPE_OBJECTPOINT;
pub const CURLOPTTYPE_SLISTPOINT = CURLOPTTYPE_OBJECTPOINT;
pub const CURLOPTTYPE_CBPOINT = CURLOPTTYPE_OBJECTPOINT;
pub const CURLOPTTYPE_VALUES = CURLOPTTYPE_LONG;
pub const CURLOPT_PROGRESSDATA = CURLOPT_XFERINFODATA;
pub const CURLOPT_POST301 = CURLOPT_POSTREDIR;
pub const CURLOPT_SSLKEYPASSWD = CURLOPT_KEYPASSWD;
pub const CURLOPT_FTPAPPEND = CURLOPT_APPEND;
pub const CURLOPT_FTPLISTONLY = CURLOPT_DIRLISTONLY;
pub const CURLOPT_FTP_SSL = CURLOPT_USE_SSL;
pub const CURLOPT_SSLCERTPASSWD = CURLOPT_KEYPASSWD;
pub const CURLOPT_KRB4LEVEL = CURLOPT_KRBLEVEL;
pub const CURLOPT_FTP_RESPONSE_TIMEOUT = CURLOPT_SERVER_RESPONSE_TIMEOUT;
pub const CURLOPT_MAIL_RCPT_ALLLOWFAILS = CURLOPT_MAIL_RCPT_ALLOWFAILS;
pub const CURL_IPRESOLVE_WHATEVER = @as(c_long, 0);
pub const CURL_IPRESOLVE_V4 = @as(c_long, 1);
pub const CURL_IPRESOLVE_V6 = @as(c_long, 2);
pub const CURLOPT_RTSPHEADER = CURLOPT_HTTPHEADER;
pub const CURL_HTTP_VERSION_NONE = @as(c_long, 0);
pub const CURL_HTTP_VERSION_1_0 = @as(c_long, 1);
pub const CURL_HTTP_VERSION_1_1 = @as(c_long, 2);
pub const CURL_HTTP_VERSION_2_0 = @as(c_long, 3);
pub const CURL_HTTP_VERSION_2TLS = @as(c_long, 4);
pub const CURL_HTTP_VERSION_2_PRIOR_KNOWLEDGE = @as(c_long, 5);
pub const CURL_HTTP_VERSION_3 = @as(c_long, 30);
pub const CURL_HTTP_VERSION_3ONLY = @as(c_long, 31);
pub const CURL_HTTP_VERSION_LAST = @as(c_long, 32);
pub const CURL_HTTP_VERSION_2 = CURL_HTTP_VERSION_2_0;
pub const CURL_RTSPREQ_NONE = @as(c_long, 0);
pub const CURL_RTSPREQ_OPTIONS = @as(c_long, 1);
pub const CURL_RTSPREQ_DESCRIBE = @as(c_long, 2);
pub const CURL_RTSPREQ_ANNOUNCE = @as(c_long, 3);
pub const CURL_RTSPREQ_SETUP = @as(c_long, 4);
pub const CURL_RTSPREQ_PLAY = @as(c_long, 5);
pub const CURL_RTSPREQ_PAUSE = @as(c_long, 6);
pub const CURL_RTSPREQ_TEARDOWN = @as(c_long, 7);
pub const CURL_RTSPREQ_GET_PARAMETER = @as(c_long, 8);
pub const CURL_RTSPREQ_SET_PARAMETER = @as(c_long, 9);
pub const CURL_RTSPREQ_RECORD = @as(c_long, 10);
pub const CURL_RTSPREQ_RECEIVE = @as(c_long, 11);
pub const CURL_RTSPREQ_LAST = @as(c_long, 12);
pub const CURL_NETRC_IGNORED = @as(c_long, 0);
pub const CURL_NETRC_OPTIONAL = @as(c_long, 1);
pub const CURL_NETRC_REQUIRED = @as(c_long, 2);
pub const CURL_SSLVERSION_DEFAULT = @as(c_long, 0);
pub const CURL_SSLVERSION_TLSv1 = @as(c_long, 1);
pub const CURL_SSLVERSION_SSLv2 = @as(c_long, 2);
pub const CURL_SSLVERSION_SSLv3 = @as(c_long, 3);
pub const CURL_SSLVERSION_TLSv1_0 = @as(c_long, 4);
pub const CURL_SSLVERSION_TLSv1_1 = @as(c_long, 5);
pub const CURL_SSLVERSION_TLSv1_2 = @as(c_long, 6);
pub const CURL_SSLVERSION_TLSv1_3 = @as(c_long, 7);
pub const CURL_SSLVERSION_LAST = @as(c_long, 8);
pub const CURL_SSLVERSION_MAX_NONE = @as(c_long, 0);
pub const CURL_SSLVERSION_MAX_DEFAULT = CURL_SSLVERSION_TLSv1 << @as(c_int, 16);
pub const CURL_SSLVERSION_MAX_TLSv1_0 = CURL_SSLVERSION_TLSv1_0 << @as(c_int, 16);
pub const CURL_SSLVERSION_MAX_TLSv1_1 = CURL_SSLVERSION_TLSv1_1 << @as(c_int, 16);
pub const CURL_SSLVERSION_MAX_TLSv1_2 = CURL_SSLVERSION_TLSv1_2 << @as(c_int, 16);
pub const CURL_SSLVERSION_MAX_TLSv1_3 = CURL_SSLVERSION_TLSv1_3 << @as(c_int, 16);
pub const CURL_SSLVERSION_MAX_LAST = CURL_SSLVERSION_LAST << @as(c_int, 16);
pub const CURL_TLSAUTH_NONE = @as(c_long, 0);
pub const CURL_TLSAUTH_SRP = @as(c_long, 1);
pub const CURL_REDIR_GET_ALL = @as(c_long, 0);
pub const CURL_REDIR_POST_301 = @as(c_long, 1);
pub const CURL_REDIR_POST_302 = @as(c_long, 2);
pub const CURL_REDIR_POST_303 = @as(c_long, 4);
pub const CURL_REDIR_POST_ALL = (CURL_REDIR_POST_301 | CURL_REDIR_POST_302) | CURL_REDIR_POST_303;
pub const CURL_TIMECOND_NONE = @as(c_long, 0);
pub const CURL_TIMECOND_IFMODSINCE = @as(c_long, 1);
pub const CURL_TIMECOND_IFUNMODSINCE = @as(c_long, 2);
pub const CURL_TIMECOND_LASTMOD = @as(c_long, 3);
pub const CURL_ZERO_TERMINATED = __helpers.cast(usize, -@as(c_int, 1));
pub const CURLMIMEOPT_FORMESCAPE = @as(c_long, 1) << @as(c_int, 0);
pub const CURLINFO_STRING = __helpers.promoteIntLiteral(c_int, 0x100000, .hex);
pub const CURLINFO_LONG = __helpers.promoteIntLiteral(c_int, 0x200000, .hex);
pub const CURLINFO_DOUBLE = __helpers.promoteIntLiteral(c_int, 0x300000, .hex);
pub const CURLINFO_SLIST = __helpers.promoteIntLiteral(c_int, 0x400000, .hex);
pub const CURLINFO_PTR = __helpers.promoteIntLiteral(c_int, 0x400000, .hex);
pub const CURLINFO_SOCKET = __helpers.promoteIntLiteral(c_int, 0x500000, .hex);
pub const CURLINFO_OFF_T = __helpers.promoteIntLiteral(c_int, 0x600000, .hex);
pub const CURLINFO_MASK = __helpers.promoteIntLiteral(c_int, 0x0fffff, .hex);
pub const CURLINFO_TYPEMASK = __helpers.promoteIntLiteral(c_int, 0xf00000, .hex);
pub const CURLINFO_HTTP_CODE = CURLINFO_RESPONSE_CODE;
pub const CURL_GLOBAL_SSL = @as(c_int, 1) << @as(c_int, 0);
pub const CURL_GLOBAL_WIN32 = @as(c_int, 1) << @as(c_int, 1);
pub const CURL_GLOBAL_ALL = CURL_GLOBAL_SSL | CURL_GLOBAL_WIN32;
pub const CURL_GLOBAL_NOTHING = @as(c_int, 0);
pub const CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL;
pub const CURL_GLOBAL_ACK_EINTR = @as(c_int, 1) << @as(c_int, 2);
pub const CURLVERSION_NOW = CURLVERSION_TWELFTH;
pub const CURL_VERSION_IPV6 = @as(c_int, 1) << @as(c_int, 0);
pub const CURL_VERSION_KERBEROS4 = @as(c_int, 1) << @as(c_int, 1);
pub const CURL_VERSION_SSL = @as(c_int, 1) << @as(c_int, 2);
pub const CURL_VERSION_LIBZ = @as(c_int, 1) << @as(c_int, 3);
pub const CURL_VERSION_NTLM = @as(c_int, 1) << @as(c_int, 4);
pub const CURL_VERSION_GSSNEGOTIATE = @as(c_int, 1) << @as(c_int, 5);
pub const CURL_VERSION_DEBUG = @as(c_int, 1) << @as(c_int, 6);
pub const CURL_VERSION_ASYNCHDNS = @as(c_int, 1) << @as(c_int, 7);
pub const CURL_VERSION_SPNEGO = @as(c_int, 1) << @as(c_int, 8);
pub const CURL_VERSION_LARGEFILE = @as(c_int, 1) << @as(c_int, 9);
pub const CURL_VERSION_IDN = @as(c_int, 1) << @as(c_int, 10);
pub const CURL_VERSION_SSPI = @as(c_int, 1) << @as(c_int, 11);
pub const CURL_VERSION_CONV = @as(c_int, 1) << @as(c_int, 12);
pub const CURL_VERSION_CURLDEBUG = @as(c_int, 1) << @as(c_int, 13);
pub const CURL_VERSION_TLSAUTH_SRP = @as(c_int, 1) << @as(c_int, 14);
pub const CURL_VERSION_NTLM_WB = @as(c_int, 1) << @as(c_int, 15);
pub const CURL_VERSION_HTTP2 = @as(c_int, 1) << @as(c_int, 16);
pub const CURL_VERSION_GSSAPI = @as(c_int, 1) << @as(c_int, 17);
pub const CURL_VERSION_KERBEROS5 = @as(c_int, 1) << @as(c_int, 18);
pub const CURL_VERSION_UNIX_SOCKETS = @as(c_int, 1) << @as(c_int, 19);
pub const CURL_VERSION_PSL = @as(c_int, 1) << @as(c_int, 20);
pub const CURL_VERSION_HTTPS_PROXY = @as(c_int, 1) << @as(c_int, 21);
pub const CURL_VERSION_MULTI_SSL = @as(c_int, 1) << @as(c_int, 22);
pub const CURL_VERSION_BROTLI = @as(c_int, 1) << @as(c_int, 23);
pub const CURL_VERSION_ALTSVC = @as(c_int, 1) << @as(c_int, 24);
pub const CURL_VERSION_HTTP3 = @as(c_int, 1) << @as(c_int, 25);
pub const CURL_VERSION_ZSTD = @as(c_int, 1) << @as(c_int, 26);
pub const CURL_VERSION_UNICODE = @as(c_int, 1) << @as(c_int, 27);
pub const CURL_VERSION_HSTS = @as(c_int, 1) << @as(c_int, 28);
pub const CURL_VERSION_GSASL = @as(c_int, 1) << @as(c_int, 29);
pub const CURL_VERSION_THREADSAFE = @as(c_int, 1) << @as(c_int, 30);
pub const CURLPAUSE_RECV = @as(c_int, 1) << @as(c_int, 0);
pub const CURLPAUSE_RECV_CONT = @as(c_int, 0);
pub const CURLPAUSE_SEND = @as(c_int, 1) << @as(c_int, 2);
pub const CURLPAUSE_SEND_CONT = @as(c_int, 0);
pub const CURLPAUSE_ALL = CURLPAUSE_RECV | CURLPAUSE_SEND;
pub const CURLPAUSE_CONT = CURLPAUSE_RECV_CONT | CURLPAUSE_SEND_CONT;
pub const CURLINC_EASY_H = "";
pub const CURL_BLOB_COPY = @as(c_int, 1);
pub const CURL_BLOB_NOCOPY = @as(c_int, 0);
pub const CURLINC_MULTI_H = "";
pub const CURLM_CALL_MULTI_SOCKET = CURLM_CALL_MULTI_PERFORM;
pub const CURLPIPE_NOTHING = @as(c_long, 0);
pub const CURLPIPE_HTTP1 = @as(c_long, 1);
pub const CURLPIPE_MULTIPLEX = @as(c_long, 2);
pub const CURL_WAIT_POLLIN = @as(c_int, 0x0001);
pub const CURL_WAIT_POLLPRI = @as(c_int, 0x0002);
pub const CURL_WAIT_POLLOUT = @as(c_int, 0x0004);
pub const CURL_POLL_NONE = @as(c_int, 0);
pub const CURL_POLL_IN = @as(c_int, 1);
pub const CURL_POLL_OUT = @as(c_int, 2);
pub const CURL_POLL_INOUT = @as(c_int, 3);
pub const CURL_POLL_REMOVE = @as(c_int, 4);
pub const CURL_SOCKET_TIMEOUT = CURL_SOCKET_BAD;
pub const CURL_CSELECT_IN = @as(c_int, 0x01);
pub const CURL_CSELECT_OUT = @as(c_int, 0x02);
pub const CURL_CSELECT_ERR = @as(c_int, 0x04);
pub const CURLMNWC_CLEAR_ALL = @as(c_long, 1) << @as(c_int, 0);
pub const CURLMNWC_CLEAR_CONNS = @as(c_long, 1) << @as(c_int, 1);
pub const CURLMNWC_CLEAR_DNS = @as(c_long, 1) << @as(c_int, 2);
pub const CURL_PUSH_OK = @as(c_int, 0);
pub const CURL_PUSH_DENY = @as(c_int, 1);
pub const CURL_PUSH_ERROROUT = @as(c_int, 2);
pub const CURLMNOTIFY_INFO_READ = @as(c_int, 0);
pub const CURLMNOTIFY_EASY_DONE = @as(c_int, 1);
pub const CURLINC_URLAPI_H = "";
pub const CURLU_DEFAULT_PORT = @as(c_int, 1) << @as(c_int, 0);
pub const CURLU_NO_DEFAULT_PORT = @as(c_int, 1) << @as(c_int, 1);
pub const CURLU_DEFAULT_SCHEME = @as(c_int, 1) << @as(c_int, 2);
pub const CURLU_NON_SUPPORT_SCHEME = @as(c_int, 1) << @as(c_int, 3);
pub const CURLU_PATH_AS_IS = @as(c_int, 1) << @as(c_int, 4);
pub const CURLU_DISALLOW_USER = @as(c_int, 1) << @as(c_int, 5);
pub const CURLU_URLDECODE = @as(c_int, 1) << @as(c_int, 6);
pub const CURLU_URLENCODE = @as(c_int, 1) << @as(c_int, 7);
pub const CURLU_APPENDQUERY = @as(c_int, 1) << @as(c_int, 8);
pub const CURLU_GUESS_SCHEME = @as(c_int, 1) << @as(c_int, 9);
pub const CURLU_NO_AUTHORITY = @as(c_int, 1) << @as(c_int, 10);
pub const CURLU_ALLOW_SPACE = @as(c_int, 1) << @as(c_int, 11);
pub const CURLU_PUNYCODE = @as(c_int, 1) << @as(c_int, 12);
pub const CURLU_PUNY2IDN = @as(c_int, 1) << @as(c_int, 13);
pub const CURLU_GET_EMPTY = @as(c_int, 1) << @as(c_int, 14);
pub const CURLU_NO_GUESS_SCHEME = @as(c_int, 1) << @as(c_int, 15);
pub const CURLINC_OPTIONS_H = "";
pub const CURLOT_FLAG_ALIAS = @as(c_int, 1) << @as(c_int, 0);
pub const CURLINC_HEADER_H = "";
pub const CURLH_HEADER = @as(c_int, 1) << @as(c_int, 0);
pub const CURLH_TRAILER = @as(c_int, 1) << @as(c_int, 1);
pub const CURLH_CONNECT = @as(c_int, 1) << @as(c_int, 2);
pub const CURLH_1XX = @as(c_int, 1) << @as(c_int, 3);
pub const CURLH_PSEUDO = @as(c_int, 1) << @as(c_int, 4);
pub const CURLINC_WEBSOCKETS_H = "";
pub const CURLWS_TEXT = @as(c_int, 1) << @as(c_int, 0);
pub const CURLWS_BINARY = @as(c_int, 1) << @as(c_int, 1);
pub const CURLWS_CONT = @as(c_int, 1) << @as(c_int, 2);
pub const CURLWS_CLOSE = @as(c_int, 1) << @as(c_int, 3);
pub const CURLWS_PING = @as(c_int, 1) << @as(c_int, 4);
pub const CURLWS_OFFSET = @as(c_int, 1) << @as(c_int, 5);
pub const CURLWS_PONG = @as(c_int, 1) << @as(c_int, 6);
pub const CURLWS_RAW_MODE = @as(c_long, 1) << @as(c_int, 0);
pub const CURLWS_NOAUTOPONG = @as(c_long, 1) << @as(c_int, 1);
pub const CURLINC_MPRINTF_H = "";
pub const CURLINC_TYPECHECK_GCC_H = "";
pub inline fn curlcheck_multicb_data_option(option: anytype) @TypeOf(((((option == CURLMOPT_NOTIFYDATA) or (option == CURLMOPT_PUSHDATA)) or (option == CURLMOPT_SOCKETDATA)) or (option == CURLMOPT_TIMERDATA)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return ((((option == CURLMOPT_NOTIFYDATA) or (option == CURLMOPT_PUSHDATA)) or (option == CURLMOPT_SOCKETDATA)) or (option == CURLMOPT_TIMERDATA)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_charpp_option(option: anytype) @TypeOf(((option == CURLMOPT_PIPELINING_SERVER_BL) or (option == CURLMOPT_PIPELINING_SITE_BL)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return ((option == CURLMOPT_PIPELINING_SERVER_BL) or (option == CURLMOPT_PIPELINING_SITE_BL)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_multitimer_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_multi_timer_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_multi_timer_callback) != 0);
}
pub inline fn curlcheck_multisocket_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_socket_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_socket_callback) != 0);
}
pub inline fn curlcheck_multipush_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_push_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_push_callback) != 0);
}
pub inline fn curlcheck_multinotify_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_notify_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_notify_callback) != 0);
}
pub const CURLWARNING = @compileError("unable to translate macro: undefined identifier `__warning__`"); // /usr/include/curl/typecheck-gcc.h:272:9
pub inline fn curlcheck_long_option(option: anytype) @TypeOf((@as(c_int, 0) < option) and (option < CURLOPTTYPE_OBJECTPOINT)) {
    _ = &option;
    return (@as(c_int, 0) < option) and (option < CURLOPTTYPE_OBJECTPOINT);
}
pub inline fn curlcheck_off_t_option(option: anytype) @TypeOf((option > CURLOPTTYPE_OFF_T) and (option < CURLOPTTYPE_BLOB)) {
    _ = &option;
    return (option > CURLOPTTYPE_OFF_T) and (option < CURLOPTTYPE_BLOB);
}
pub inline fn curlcheck_curl_option(option: anytype) @TypeOf(((option == CURLOPT_STREAM_DEPENDS) or (option == CURLOPT_STREAM_DEPENDS_E)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return ((option == CURLOPT_STREAM_DEPENDS) or (option == CURLOPT_STREAM_DEPENDS_E)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_string_option(option: anytype) @TypeOf((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((option == CURLOPT_ABSTRACT_UNIX_SOCKET) or (option == CURLOPT_ACCEPT_ENCODING)) or (option == CURLOPT_ALTSVC)) or (option == CURLOPT_CAINFO)) or (option == CURLOPT_CAPATH)) or (option == CURLOPT_COOKIE)) or (option == CURLOPT_COOKIEFILE)) or (option == CURLOPT_COOKIEJAR)) or (option == CURLOPT_COOKIELIST)) or (option == CURLOPT_CRLFILE)) or (option == CURLOPT_CUSTOMREQUEST)) or (option == CURLOPT_DEFAULT_PROTOCOL)) or (option == CURLOPT_DNS_INTERFACE)) or (option == CURLOPT_DNS_LOCAL_IP4)) or (option == CURLOPT_DNS_LOCAL_IP6)) or (option == CURLOPT_DNS_SERVERS)) or (option == CURLOPT_DOH_URL)) or (option == CURLOPT_ECH)) or (option == CURLOPT_EGDSOCKET)) or (option == CURLOPT_FTP_ACCOUNT)) or (option == CURLOPT_FTP_ALTERNATIVE_TO_USER)) or (option == CURLOPT_FTPPORT)) or (option == CURLOPT_HAPROXY_CLIENT_IP)) or (option == CURLOPT_HSTS)) or (option == CURLOPT_INTERFACE)) or (option == CURLOPT_ISSUERCERT)) or (option == CURLOPT_KEYPASSWD)) or (option == CURLOPT_KRBLEVEL)) or (option == CURLOPT_LOGIN_OPTIONS)) or (option == CURLOPT_MAIL_AUTH)) or (option == CURLOPT_MAIL_FROM)) or (option == CURLOPT_NETRC_FILE)) or (option == CURLOPT_NOPROXY)) or (option == CURLOPT_PASSWORD)) or (option == CURLOPT_PINNEDPUBLICKEY)) or (option == CURLOPT_PRE_PROXY)) or (option == CURLOPT_PROTOCOLS_STR)) or (option == CURLOPT_PROXY)) or (option == CURLOPT_PROXY_CAINFO)) or (option == CURLOPT_PROXY_CAPATH)) or (option == CURLOPT_PROXY_CRLFILE)) or (option == CURLOPT_PROXY_ISSUERCERT)) or (option == CURLOPT_PROXY_KEYPASSWD)) or (option == CURLOPT_PROXY_PINNEDPUBLICKEY)) or (option == CURLOPT_PROXY_SERVICE_NAME)) or (option == CURLOPT_PROXY_SSL_CIPHER_LIST)) or (option == CURLOPT_PROXY_SSLCERT)) or (option == CURLOPT_PROXY_SSLCERTTYPE)) or (option == CURLOPT_PROXY_SSLKEY)) or (option == CURLOPT_PROXY_SSLKEYTYPE)) or (option == CURLOPT_PROXY_TLS13_CIPHERS)) or (option == CURLOPT_PROXY_TLSAUTH_PASSWORD)) or (option == CURLOPT_PROXY_TLSAUTH_TYPE)) or (option == CURLOPT_PROXY_TLSAUTH_USERNAME)) or (option == CURLOPT_PROXYPASSWORD)) or (option == CURLOPT_PROXYUSERNAME)) or (option == CURLOPT_PROXYUSERPWD)) or (option == CURLOPT_RANDOM_FILE)) or (option == CURLOPT_RANGE)) or (option == CURLOPT_REDIR_PROTOCOLS_STR)) or (option == CURLOPT_REFERER)) or (option == CURLOPT_REQUEST_TARGET)) or (option == CURLOPT_RTSP_SESSION_ID)) or (option == CURLOPT_RTSP_STREAM_URI)) or (option == CURLOPT_RTSP_TRANSPORT)) or (option == CURLOPT_SASL_AUTHZID)) or (option == CURLOPT_SERVICE_NAME)) or (option == CURLOPT_SOCKS5_GSSAPI_SERVICE)) or (option == CURLOPT_SSH_HOST_PUBLIC_KEY_MD5)) or (option == CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256)) or (option == CURLOPT_SSH_KNOWNHOSTS)) or (option == CURLOPT_SSH_PRIVATE_KEYFILE)) or (option == CURLOPT_SSH_PUBLIC_KEYFILE)) or (option == CURLOPT_SSLCERT)) or (option == CURLOPT_SSLCERTTYPE)) or (option == CURLOPT_SSLENGINE)) or (option == CURLOPT_SSLKEY)) or (option == CURLOPT_SSLKEYTYPE)) or (option == CURLOPT_SSL_CIPHER_LIST)) or (option == CURLOPT_SSL_EC_CURVES)) or (option == CURLOPT_SSL_SIGNATURE_ALGORITHMS)) or (option == CURLOPT_TLS13_CIPHERS)) or (option == CURLOPT_TLSAUTH_PASSWORD)) or (option == CURLOPT_TLSAUTH_TYPE)) or (option == CURLOPT_TLSAUTH_USERNAME)) or (option == CURLOPT_UNIX_SOCKET_PATH)) or (option == CURLOPT_URL)) or (option == CURLOPT_USERAGENT)) or (option == CURLOPT_USERNAME)) or (option == CURLOPT_AWS_SIGV4)) or (option == CURLOPT_HTTPSIG_HEADERS)) or (option == CURLOPT_HTTPSIG_KEY)) or (option == CURLOPT_HTTPSIG_KEYID)) or (option == CURLOPT_USERPWD)) or (option == CURLOPT_XOAUTH2_BEARER)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((option == CURLOPT_ABSTRACT_UNIX_SOCKET) or (option == CURLOPT_ACCEPT_ENCODING)) or (option == CURLOPT_ALTSVC)) or (option == CURLOPT_CAINFO)) or (option == CURLOPT_CAPATH)) or (option == CURLOPT_COOKIE)) or (option == CURLOPT_COOKIEFILE)) or (option == CURLOPT_COOKIEJAR)) or (option == CURLOPT_COOKIELIST)) or (option == CURLOPT_CRLFILE)) or (option == CURLOPT_CUSTOMREQUEST)) or (option == CURLOPT_DEFAULT_PROTOCOL)) or (option == CURLOPT_DNS_INTERFACE)) or (option == CURLOPT_DNS_LOCAL_IP4)) or (option == CURLOPT_DNS_LOCAL_IP6)) or (option == CURLOPT_DNS_SERVERS)) or (option == CURLOPT_DOH_URL)) or (option == CURLOPT_ECH)) or (option == CURLOPT_EGDSOCKET)) or (option == CURLOPT_FTP_ACCOUNT)) or (option == CURLOPT_FTP_ALTERNATIVE_TO_USER)) or (option == CURLOPT_FTPPORT)) or (option == CURLOPT_HAPROXY_CLIENT_IP)) or (option == CURLOPT_HSTS)) or (option == CURLOPT_INTERFACE)) or (option == CURLOPT_ISSUERCERT)) or (option == CURLOPT_KEYPASSWD)) or (option == CURLOPT_KRBLEVEL)) or (option == CURLOPT_LOGIN_OPTIONS)) or (option == CURLOPT_MAIL_AUTH)) or (option == CURLOPT_MAIL_FROM)) or (option == CURLOPT_NETRC_FILE)) or (option == CURLOPT_NOPROXY)) or (option == CURLOPT_PASSWORD)) or (option == CURLOPT_PINNEDPUBLICKEY)) or (option == CURLOPT_PRE_PROXY)) or (option == CURLOPT_PROTOCOLS_STR)) or (option == CURLOPT_PROXY)) or (option == CURLOPT_PROXY_CAINFO)) or (option == CURLOPT_PROXY_CAPATH)) or (option == CURLOPT_PROXY_CRLFILE)) or (option == CURLOPT_PROXY_ISSUERCERT)) or (option == CURLOPT_PROXY_KEYPASSWD)) or (option == CURLOPT_PROXY_PINNEDPUBLICKEY)) or (option == CURLOPT_PROXY_SERVICE_NAME)) or (option == CURLOPT_PROXY_SSL_CIPHER_LIST)) or (option == CURLOPT_PROXY_SSLCERT)) or (option == CURLOPT_PROXY_SSLCERTTYPE)) or (option == CURLOPT_PROXY_SSLKEY)) or (option == CURLOPT_PROXY_SSLKEYTYPE)) or (option == CURLOPT_PROXY_TLS13_CIPHERS)) or (option == CURLOPT_PROXY_TLSAUTH_PASSWORD)) or (option == CURLOPT_PROXY_TLSAUTH_TYPE)) or (option == CURLOPT_PROXY_TLSAUTH_USERNAME)) or (option == CURLOPT_PROXYPASSWORD)) or (option == CURLOPT_PROXYUSERNAME)) or (option == CURLOPT_PROXYUSERPWD)) or (option == CURLOPT_RANDOM_FILE)) or (option == CURLOPT_RANGE)) or (option == CURLOPT_REDIR_PROTOCOLS_STR)) or (option == CURLOPT_REFERER)) or (option == CURLOPT_REQUEST_TARGET)) or (option == CURLOPT_RTSP_SESSION_ID)) or (option == CURLOPT_RTSP_STREAM_URI)) or (option == CURLOPT_RTSP_TRANSPORT)) or (option == CURLOPT_SASL_AUTHZID)) or (option == CURLOPT_SERVICE_NAME)) or (option == CURLOPT_SOCKS5_GSSAPI_SERVICE)) or (option == CURLOPT_SSH_HOST_PUBLIC_KEY_MD5)) or (option == CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256)) or (option == CURLOPT_SSH_KNOWNHOSTS)) or (option == CURLOPT_SSH_PRIVATE_KEYFILE)) or (option == CURLOPT_SSH_PUBLIC_KEYFILE)) or (option == CURLOPT_SSLCERT)) or (option == CURLOPT_SSLCERTTYPE)) or (option == CURLOPT_SSLENGINE)) or (option == CURLOPT_SSLKEY)) or (option == CURLOPT_SSLKEYTYPE)) or (option == CURLOPT_SSL_CIPHER_LIST)) or (option == CURLOPT_SSL_EC_CURVES)) or (option == CURLOPT_SSL_SIGNATURE_ALGORITHMS)) or (option == CURLOPT_TLS13_CIPHERS)) or (option == CURLOPT_TLSAUTH_PASSWORD)) or (option == CURLOPT_TLSAUTH_TYPE)) or (option == CURLOPT_TLSAUTH_USERNAME)) or (option == CURLOPT_UNIX_SOCKET_PATH)) or (option == CURLOPT_URL)) or (option == CURLOPT_USERAGENT)) or (option == CURLOPT_USERNAME)) or (option == CURLOPT_AWS_SIGV4)) or (option == CURLOPT_HTTPSIG_HEADERS)) or (option == CURLOPT_HTTPSIG_KEY)) or (option == CURLOPT_HTTPSIG_KEYID)) or (option == CURLOPT_USERPWD)) or (option == CURLOPT_XOAUTH2_BEARER)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_write_cb_option(option: anytype) @TypeOf((option == CURLOPT_HEADERFUNCTION) or (option == CURLOPT_WRITEFUNCTION)) {
    _ = &option;
    return (option == CURLOPT_HEADERFUNCTION) or (option == CURLOPT_WRITEFUNCTION);
}
pub inline fn curlcheck_conv_cb_option(option: anytype) @TypeOf(((option == CURLOPT_CONV_TO_NETWORK_FUNCTION) or (option == CURLOPT_CONV_FROM_NETWORK_FUNCTION)) or (option == CURLOPT_CONV_FROM_UTF8_FUNCTION)) {
    _ = &option;
    return ((option == CURLOPT_CONV_TO_NETWORK_FUNCTION) or (option == CURLOPT_CONV_FROM_NETWORK_FUNCTION)) or (option == CURLOPT_CONV_FROM_UTF8_FUNCTION);
}
pub inline fn curlcheck_cb_data_option(option: anytype) @TypeOf((((((((((((((((((((((option == CURLOPT_CHUNK_DATA) or (option == CURLOPT_CLOSESOCKETDATA)) or (option == CURLOPT_DEBUGDATA)) or (option == CURLOPT_FNMATCH_DATA)) or (option == CURLOPT_HEADERDATA)) or (option == CURLOPT_HSTSREADDATA)) or (option == CURLOPT_HSTSWRITEDATA)) or (option == CURLOPT_INTERLEAVEDATA)) or (option == CURLOPT_IOCTLDATA)) or (option == CURLOPT_OPENSOCKETDATA)) or (option == CURLOPT_PREREQDATA)) or (option == CURLOPT_XFERINFODATA)) or (option == CURLOPT_READDATA)) or (option == CURLOPT_SEEKDATA)) or (option == CURLOPT_SOCKOPTDATA)) or (option == CURLOPT_SSH_KEYDATA)) or (option == CURLOPT_SSL_CTX_DATA)) or (option == CURLOPT_WRITEDATA)) or (option == CURLOPT_RESOLVER_START_DATA)) or (option == CURLOPT_TRAILERDATA)) or (option == CURLOPT_SSH_HOSTKEYDATA)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return (((((((((((((((((((((option == CURLOPT_CHUNK_DATA) or (option == CURLOPT_CLOSESOCKETDATA)) or (option == CURLOPT_DEBUGDATA)) or (option == CURLOPT_FNMATCH_DATA)) or (option == CURLOPT_HEADERDATA)) or (option == CURLOPT_HSTSREADDATA)) or (option == CURLOPT_HSTSWRITEDATA)) or (option == CURLOPT_INTERLEAVEDATA)) or (option == CURLOPT_IOCTLDATA)) or (option == CURLOPT_OPENSOCKETDATA)) or (option == CURLOPT_PREREQDATA)) or (option == CURLOPT_XFERINFODATA)) or (option == CURLOPT_READDATA)) or (option == CURLOPT_SEEKDATA)) or (option == CURLOPT_SOCKOPTDATA)) or (option == CURLOPT_SSH_KEYDATA)) or (option == CURLOPT_SSL_CTX_DATA)) or (option == CURLOPT_WRITEDATA)) or (option == CURLOPT_RESOLVER_START_DATA)) or (option == CURLOPT_TRAILERDATA)) or (option == CURLOPT_SSH_HOSTKEYDATA)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_postfields_option(option: anytype) @TypeOf(((option == CURLOPT_POSTFIELDS) or (option == CURLOPT_COPYPOSTFIELDS)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return ((option == CURLOPT_POSTFIELDS) or (option == CURLOPT_COPYPOSTFIELDS)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_slist_option(option: anytype) @TypeOf(((((((((((option == CURLOPT_HTTP200ALIASES) or (option == CURLOPT_HTTPHEADER)) or (option == CURLOPT_MAIL_RCPT)) or (option == CURLOPT_POSTQUOTE)) or (option == CURLOPT_PREQUOTE)) or (option == CURLOPT_PROXYHEADER)) or (option == CURLOPT_QUOTE)) or (option == CURLOPT_RESOLVE)) or (option == CURLOPT_TELNETOPTIONS)) or (option == CURLOPT_CONNECT_TO)) or (@as(c_int, 0) != 0)) {
    _ = &option;
    return ((((((((((option == CURLOPT_HTTP200ALIASES) or (option == CURLOPT_HTTPHEADER)) or (option == CURLOPT_MAIL_RCPT)) or (option == CURLOPT_POSTQUOTE)) or (option == CURLOPT_PREQUOTE)) or (option == CURLOPT_PROXYHEADER)) or (option == CURLOPT_QUOTE)) or (option == CURLOPT_RESOLVE)) or (option == CURLOPT_TELNETOPTIONS)) or (option == CURLOPT_CONNECT_TO)) or (@as(c_int, 0) != 0);
}
pub inline fn curlcheck_string_info(info: anytype) @TypeOf(((CURLINFO_STRING < info) and (info < CURLINFO_LONG)) and (info != CURLINFO_PRIVATE)) {
    _ = &info;
    return ((CURLINFO_STRING < info) and (info < CURLINFO_LONG)) and (info != CURLINFO_PRIVATE);
}
pub inline fn curlcheck_long_info(info: anytype) @TypeOf((CURLINFO_LONG < info) and (info < CURLINFO_DOUBLE)) {
    _ = &info;
    return (CURLINFO_LONG < info) and (info < CURLINFO_DOUBLE);
}
pub inline fn curlcheck_double_info(info: anytype) @TypeOf((CURLINFO_DOUBLE < info) and (info < CURLINFO_SLIST)) {
    _ = &info;
    return (CURLINFO_DOUBLE < info) and (info < CURLINFO_SLIST);
}
pub inline fn curlcheck_slist_info(info: anytype) @TypeOf((info == CURLINFO_SSL_ENGINES) or (info == CURLINFO_COOKIELIST)) {
    _ = &info;
    return (info == CURLINFO_SSL_ENGINES) or (info == CURLINFO_COOKIELIST);
}
pub inline fn curlcheck_tlssessioninfo_info(info: anytype) @TypeOf((info == CURLINFO_TLS_SSL_PTR) or (info == CURLINFO_TLS_SESSION)) {
    _ = &info;
    return (info == CURLINFO_TLS_SSL_PTR) or (info == CURLINFO_TLS_SESSION);
}
pub inline fn curlcheck_certinfo_info(info: anytype) @TypeOf(info == CURLINFO_CERTINFO) {
    _ = &info;
    return info == CURLINFO_CERTINFO;
}
pub inline fn curlcheck_socket_info(info: anytype) @TypeOf((CURLINFO_SOCKET < info) and (info < CURLINFO_OFF_T)) {
    _ = &info;
    return (CURLINFO_SOCKET < info) and (info < CURLINFO_OFF_T);
}
pub inline fn curlcheck_off_t_info(info: anytype) @TypeOf(CURLINFO_OFF_T < info) {
    _ = &info;
    return CURLINFO_OFF_T < info;
}
pub const curlcheck_any_ptr = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:612:9
pub const curlcheck_NULL = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:618:9
pub const curlcheck_ptr = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:622:9
pub const curlcheck_ptrptr = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:628:9
pub const curlcheck_arr = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:636:9
pub inline fn curlcheck_string(expr: anytype) @TypeOf(((curlcheck_arr(expr, u8) != 0) or (curlcheck_arr(expr, i8) != 0)) or (curlcheck_arr(expr, u8) != 0)) {
    _ = &expr;
    return ((curlcheck_arr(expr, u8) != 0) or (curlcheck_arr(expr, i8) != 0)) or (curlcheck_arr(expr, u8) != 0);
}
pub const curlcheck_curl = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:647:9
pub const curlcheck_long = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:654:9
pub const curlcheck_off_t = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:677:9
pub const curlcheck_error_buffer = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:682:9
pub inline fn curlcheck_cb_data(expr: anytype) @TypeOf(curlcheck_any_ptr(expr)) {
    _ = &expr;
    return curlcheck_any_ptr(expr);
}
pub const curlcheck_FILE = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:698:9
pub inline fn curlcheck_postfields(expr: anytype) @TypeOf(((curlcheck_ptr(expr, anyopaque) != 0) or (curlcheck_arr(expr, u8) != 0)) or (curlcheck_arr(expr, u8) != 0)) {
    _ = &expr;
    return ((curlcheck_ptr(expr, anyopaque) != 0) or (curlcheck_arr(expr, u8) != 0)) or (curlcheck_arr(expr, u8) != 0);
}
pub const curlcheck_cb_compatible = @compileError("unable to translate macro: undefined identifier `__builtin_types_compatible_p`"); // /usr/include/curl/typecheck-gcc.h:710:9
pub inline fn curlcheck_resolver_start_callback(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_resolver_start_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_resolver_start_callback) != 0);
}
pub const curlcheck_read_cb = @compileError("unable to translate C expr: unexpected token '__typeof__'"); // /usr/include/curl/typecheck-gcc.h:720:9
pub const curlcheck_write_cb = @compileError("unable to translate C expr: unexpected token '__typeof__'"); // /usr/include/curl/typecheck-gcc.h:738:9
pub inline fn curlcheck_ioctl_cb(expr: anytype) @TypeOf((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_ioctl_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback4) != 0)) {
    _ = &expr;
    return (((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_ioctl_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ioctl_callback4) != 0);
}
pub inline fn curlcheck_sockopt_cb(expr: anytype) @TypeOf((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sockopt_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_sockopt_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_sockopt_callback2) != 0)) {
    _ = &expr;
    return (((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sockopt_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_sockopt_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_sockopt_callback2) != 0);
}
pub inline fn curlcheck_opensocket_cb(expr: anytype) @TypeOf((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_opensocket_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback4) != 0)) {
    _ = &expr;
    return (((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_opensocket_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_opensocket_callback4) != 0);
}
pub inline fn curlcheck_progress_cb(expr: anytype) @TypeOf((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_progress_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_progress_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_progress_callback2) != 0)) {
    _ = &expr;
    return (((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_progress_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_progress_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_progress_callback2) != 0);
}
pub inline fn curlcheck_xferinfo_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_xferinfo_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_xferinfo_callback) != 0);
}
pub inline fn curlcheck_debug_cb(expr: anytype) @TypeOf((((((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_debug_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback4) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback5) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback6) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback7) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback8) != 0)) {
    _ = &expr;
    return (((((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_debug_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback4) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback5) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback6) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback7) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_debug_callback8) != 0);
}
pub inline fn curlcheck_ssl_ctx_cb(expr: anytype) @TypeOf((((((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_ssl_ctx_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback4) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback5) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback6) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback7) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback8) != 0)) {
    _ = &expr;
    return (((((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_ssl_ctx_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback4) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback5) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback6) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback7) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_ssl_ctx_callback8) != 0);
}
pub inline fn curlcheck_conv_cb(expr: anytype) @TypeOf((((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_conv_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback4) != 0)) {
    _ = &expr;
    return (((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_conv_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback2) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback3) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_conv_callback4) != 0);
}
pub inline fn curlcheck_seek_cb(expr: anytype) @TypeOf((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_seek_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_seek_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_seek_callback2) != 0)) {
    _ = &expr;
    return (((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_seek_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_seek_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_seek_callback2) != 0);
}
pub inline fn curlcheck_chunk_bgn_cb(expr: anytype) @TypeOf((((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_chunk_bgn_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_chunk_bgn_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_chunk_bgn_callback2) != 0)) {
    _ = &expr;
    return (((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_chunk_bgn_callback) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_chunk_bgn_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_chunk_bgn_callback2) != 0);
}
pub inline fn curlcheck_chunk_end_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_chunk_end_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_chunk_end_callback) != 0);
}
pub inline fn curlcheck_close_socket_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_closesocket_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_closesocket_callback) != 0);
}
pub inline fn curlcheck_fnmatch_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_fnmatch_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_fnmatch_callback) != 0);
}
pub inline fn curlcheck_hstsread_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_hstsread_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_hstsread_callback) != 0);
}
pub inline fn curlcheck_hstswrite_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_hstswrite_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_hstswrite_callback) != 0);
}
pub inline fn curlcheck_ssh_hostkey_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sshhostkeycallback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sshhostkeycallback) != 0);
}
pub inline fn curlcheck_ssh_key_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sshkeycallback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_sshkeycallback) != 0);
}
pub inline fn curlcheck_interleave_cb(expr: anytype) @TypeOf(((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, Wcurl_interleave_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_interleave_callback2) != 0)) {
    _ = &expr;
    return ((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, Wcurl_interleave_callback1) != 0)) or (curlcheck_cb_compatible(expr, Wcurl_interleave_callback2) != 0);
}
pub inline fn curlcheck_prereq_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_prereq_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_prereq_callback) != 0);
}
pub inline fn curlcheck_trailer_cb(expr: anytype) @TypeOf((curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_trailer_callback) != 0)) {
    _ = &expr;
    return (curlcheck_NULL(expr) != 0) or (curlcheck_cb_compatible(expr, curl_trailer_callback) != 0);
}
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const iovec = struct_iovec;
pub const __socket_type = enum___socket_type;
pub const sockaddr = struct_sockaddr;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const linger = struct_linger;
pub const osockaddr = struct_osockaddr;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const tm = struct_tm;
pub const itimerspec = struct_itimerspec;
pub const sigevent = struct_sigevent;
pub const __locale_struct = struct___locale_struct;
pub const __itimer_which = enum___itimer_which;
pub const itimerval = struct_itimerval;
pub const curl_slist = struct_curl_slist;
pub const curl_httppost = struct_curl_httppost;
pub const curl_fileinfo = struct_curl_fileinfo;
pub const curl_sockaddr = struct_curl_sockaddr;
pub const curl_khtype = enum_curl_khtype;
pub const curl_khkey = struct_curl_khkey;
pub const curl_khstat = enum_curl_khstat;
pub const curl_khmatch = enum_curl_khmatch;
pub const curl_hstsentry = struct_curl_hstsentry;
pub const curl_index = struct_curl_index;
pub const CURL_NETRC_OPTION = enum_CURL_NETRC_OPTION;
pub const CURL_TLSAUTH = enum_CURL_TLSAUTH;
pub const curl_forms = struct_curl_forms;
pub const curl_certinfo = struct_curl_certinfo;
pub const curl_tlssessioninfo = struct_curl_tlssessioninfo;
pub const curl_blob = struct_curl_blob;
pub const curl_waitfd = struct_curl_waitfd;
pub const curl_pushheaders = struct_curl_pushheaders;
pub const Curl_URL = struct_Curl_URL;
pub const curl_easyoption = struct_curl_easyoption;
pub const curl_header = struct_curl_header;
pub const curl_ws_frame = struct_curl_ws_frame;
