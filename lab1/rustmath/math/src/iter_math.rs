pub struct ExtendedGDC
{
    pub x : i64,
    pub y: i64,
    pub d: i64
}

pub struct Pair
{
   pub x: i64,
   pub y:  i64
}








pub fn euclid_extend( a : i64, b: i64)->ExtendedGDC
{
    
    // Base Case
    if b == 0 
    {
        let res = ExtendedGDC { d:a, x:1, y:0};
        return res;
    }
    
    let mut res =  euclid_extend(b,a%b);
    let t = res.y;
    res.y = res.x - (a/b)*(res.y);
    res.x = t;
    return res;
}

pub fn Diophant (a:i64,b : i64,c:i64)-> Pair
{
    let gcd = euclid_extend(a,b);
    let mut res = Pair {x:0,y:0};

    if c%gcd.d == 0
    {
        res.x = gcd.x*(c/gcd.d);
        res.y =gcd.y * (c/gcd.d);
    }
   
    return res;
}