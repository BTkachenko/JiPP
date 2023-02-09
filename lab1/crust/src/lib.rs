

use std::ffi::c_long;


#[repr(C)]
pub struct pair
{
   pub x : c_long,
   pub y : c_long,
}

#[link(name="rec_math")]
extern "C"
{
   pub fn abs(input: i32) -> i32;
   pub fn factorial(input:i64) -> i64;
   pub fn NWD(a:i64, b:i64) -> i64;
   pub fn euclid_extend(a:i64,b:i64,x: *mut i64, y: *mut i64) -> i64;
   pub fn Diophant(a:i64,b:i64,c:i64)->pair;
}