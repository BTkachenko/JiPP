public class DIVIDEbyZeroException:Exception{
    public DIVIDEbyZeroException() :base("!!! CANT DIVIDE BY 0 !!!"){}
} 


public class GF {
    static public long P = 1234567891;

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


    private static long Inverse(long a)
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

    


    public static GF operator + ( GF gf1, GF gf2) {
        GF temp = new GF();
        temp.setValue( (gf1.getValue() + gf2.getValue())% P);
        return temp;
    }
    public static GF operator -( GF gf1,GF gf2) {
        GF temp = new GF();
        temp.setValue((P + (gf1.getValue() - gf2.getValue())) % P);
        return temp;
    }
    public static GF operator * ( GF gf1, GF gf2) {
        GF temp = new GF();
        temp.setValue( (gf1.getValue() * gf2.getValue())% P);
        return temp;
    }
    public static GF operator / ( GF gf1, GF gf2) {
        GF temp = new GF();
        if( gf2.getValue() == 0){
        throw new DIVIDEbyZeroException();
        }

        temp.setValue( (gf1.getValue() * Inverse(gf2.getValue())) % P);

        return temp;
    }

//Operatory z  intami

    public static GF operator + ( GF gf1, long x) {
        GF temp = new GF();
        temp.setValue( (gf1.getValue() + x)% P);
        return temp;
    }
    public static GF operator -( GF gf1,long x) {
        GF temp = new GF();
        temp.setValue((P + (gf1.getValue() - x)) % P);
        return temp;
    }
    public static GF operator * ( GF gf1, long x) {
        GF temp = new GF();
        temp.setValue( (gf1.getValue() * x)% P);
        return temp;
    }
    public static GF operator / ( GF gf1, long x) {
        GF temp = new GF();
        if( x == 0){
        throw new DIVIDEbyZeroException();
        }

        temp.setValue( (gf1.getValue() * Inverse(x)) % P);

        return temp;
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
    public GF GFdiv(long x) {
        if(x == 0) {
            throw new DIVIDEbyZeroException();
        }
        this.value = (this.value * Inverse(x)) % P;
        return this;
    }



    //ToInt
    public static long ToLong( GF gf)
    {
        return gf.value;
    }

    public override String ToString() {
        return ("GF(" + this.order + ") = " + this.value );
    }
}
