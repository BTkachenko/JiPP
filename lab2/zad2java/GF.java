package zad2java;

public class GF implements Comparable<GF>{
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


    private static long Inverse(final long a)
    {
        long y = 1;
        long n = P - 2;
        long x = a;
        while(n>0){
            if(n%2 == 1)
                y = (y*x) % P;
            n = n/2;
            x = (x*x) % P;
        }

        return y;
    }

    @Override
    public int compareTo(GF gf) {
        return Long.compare(getValue(),gf.getValue());
    }


    public GF GFAdd(final GF gf) {
        this.value = (this.value + gf.value) % P;
        return this;
    }
    public GF GFsub(final GF gf) {
        this.value = (P + (this.value - gf.value)) % P;
        return this;
    }
    public GF GFmulti(final GF gf) {
        this.value = (this.value * gf.value) % P;
        return this;
    }
    public GF GFdiv(final GF gf) throws IllegalArgumentException{
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
        this.value = (this.value + x) % P;
        return this;
    }
    public GF GFsub(long x) {
        this.value = (P + (this.value + x)) % P;
        return this;
    }
    public GF GFmulti(long x) {
        this.value = (this.value * x) % P;
        return this;
    }
    public GF GFdiv(long x) throws IllegalArgumentException{
        if(x == 0) {
            throw new IllegalArgumentException("!!! CANT DIVIDE BY 0! !!!");
        }
        this.value = (this.value * Inverse(x)) % P;
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
}
