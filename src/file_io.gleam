// see https://gitlab.com/greggreg/gleam_file/-/tree/master

pub type PosixError {
  Eacces
  Eagain
  Ebadf
  Ebadmsg
  Ebusy
  Edeadlk
  Edeadlock
  Edquot
  Eexist
  Efault
  Efbig
  Eftype
  Eintr
  Einval
  Eio
  Eisdir
  Eloop
  Emfile
  Emlink
  Emultihop
  Enametoolong
  Enfile
  Enobufs
  Enodev
  Enolck
  Enolink
  Enoent
  Enomem
  Enospc
  Enosr
  Enostr
  Enosys
  Enotblk
  Enotdir
  Enotsup
  Enxio
  Eopnotsupp
  Eoverflow
  Eperm
  Epipe
  Erange
  Erofs
  Espipe
  Esrch
  Estale
  Etxtbsy
  Exdev

  // TODO: not part of posix, but can be returned by:
  // keep these here or do something else?
  // read_file | write_file | copy | etc.
  Badarg
  // read_file | write_file | copy | etc.
  Terminated
  // read_file | write_file | etc
  SystemLimit

  // file:list_dir
  // https://erlang.org/doc/man/file.html#list_dir-1
  NoTranslation(String)
}

pub fn read_to_bitstring(
  filename filename: String,
) -> Result(BitString, PosixError) {
  do_read_to_bitstring(filename)
}

external fn do_read_to_bitstring(
  filename: String,
) -> Result(BitString, PosixError) =
  "file" "read_file"