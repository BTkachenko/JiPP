use crust::Diophant;



fn main() {
    unsafe {
    let fac = crust::factorial(5);
        
    let mut x:i64 = 0;
    let mut y:i64 = 0;
    let rawx = &mut x;
    let rawy = &mut y;

        let gcd = crust::euclid_extend(4, 6, rawx,rawy);

        let res = Diophant(4, 6, 10);

        println!("Diophant of 4,6,10 {},{}",res.x,res.y);
    
    
    println!("C factorial call : {}",fac);
    };
    

}
