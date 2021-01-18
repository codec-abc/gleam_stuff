import gleam/bit_string
import gleam/io
import gleam/result
import gleam/list
import file_io

pub external type CharList

external fn char_list_to_string(CharList) -> String =
  "erlang" "list_to_binary"

type Point2D {
  Point2D(x: Float, y: Float)
}

fn add_points(point1: Point2D, point2: Point2D) -> Point2D {
  Point2D(point1.x +. point2.x, point1.y +. point2.y)
}

pub fn main(args: List(CharList)) -> Result(Nil, Nil) {
  io.println("Starting main")
  let args = list.map(args, char_list_to_string)
  try result = result.nil_error(file_io.read_to_bitstring("file.txt"))
  try content = result.nil_error(bit_string.to_string(result))
  io.println(content)
  io.println("Ending main")
  Ok(Nil)
}
