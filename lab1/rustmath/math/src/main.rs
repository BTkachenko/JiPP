use math::rec_math;

fn main() {

    let test = rec_math::euclid_extend(18,12);
    let result = rec_math::Diophant(4,6,10);
    println!("Extended euclid : {}",test.d);
    println!("Equation solves: x = {} , y = {}",result.x,result.y);
}
