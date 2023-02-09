
  class GF implements TypeInterface<GF>{
    public static final long P = 1234567891;

    private long value;
    private long order;

    public GF() {
        this.value = 0;
        this.order = P;
    }
    public GF(long value, long order) {
        this.value = value;
        this.order = order;
    }


    public long getValue() {
        return value;
    }

    public void setValue(long value) {
        this.value = value;
    }


   
    private  long Inverse(final long a)
    {
        long y = 1;
        long n = this.order - 2;
        long x = a;
        while(n>0){
            if(n%2 == 1)
                y = (y*x) % this.order;
            n = n/2;
            x = (x*x) % this.order;
        }

        return y;
    }

    
    public int compareTo(GF gf) {
        return Long.compare(getValue(),gf.getValue());
    }


    public GF sum(final GF gf) {
        this.value = (this.value + gf.value) % this.order;
        return this;
    }
    public GF sub(final GF gf) {
        this.value = (this.order + (this.value - gf.value)) % this.order;
        return this;
    }
    public GF mul(final GF gf) {
        this.value = (this.value * gf.value) % this.order;
        return this;
    }
    public GF div(final GF gf) throws IllegalArgumentException{
        if(gf.getValue() == 0) {
            throw new IllegalArgumentException("!!! CANT DIVIDE BY 0! !!!");
        }
        this.value = (this.value * Inverse(gf.getValue())) % P;
        return this;
    }


    public int compareTo(long x) {
        return Long.compare(getValue(),x);
    }

    public GF GFAdd(long x) {
        this.value = (this.value + x) % this.order;
        return this;
    }
    public GF GFsub(long x) {
        this.value = (this.order + (this.value + x)) % this.order;
        return this;
    }
    public GF GFmulti(long x) {
        this.value = (this.value * x) % this.order;
        return this;
    }
    public GF GFdiv(long x) throws IllegalArgumentException{
        if(x == 0) {
            throw new IllegalArgumentException("!!! CANT DIVIDE BY 0! !!!");
        }
        this.value = (this.value * Inverse(x)) % this.order;
        return this;
    }



    //ToInt
    public static long ToLong(final GF gf)
    {
        return gf.value;
    }

    public String toString() {
        return ("GF(" + this.order + ") = " + this.value );
    }
    @Override
    public GF zeroElem() {
        // TODO Auto-generated method stub
        return new GF(0, this.order);
    }
    @Override
    public GF oneElem() {
        // TODO Auto-generated method stub
        return new GF(1, this.order);
    }
    @Override
    public GF negate() {
        // TODO Auto-generated method stub
        return new GF(order - value, this.order);
        }
    @Override
    public GF inverse() throws ArithmeticException {
        // TODO Auto-generated method stub
        return new GF(Inverse(value),order);
    }
    
  }

