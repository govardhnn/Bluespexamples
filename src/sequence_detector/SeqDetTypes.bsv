package SeqDetTypes;

        import FShow :: *;
        import ClientServer :: *;
        import GetPut :: *;

        typedef 16  Addr_Width;
        typedef 256 Data_Width;
        typedef Bit #(Addr_Width) MAddr;
        typedef Bit #(Data_Width) MData;

        // request type
        typedef struct {
                MAddr       addr;     // start address
                Bit #(4)    words;    // number of mem-words
                Bit #(8)    pattern;
        } ReqType deriving (Bits, FShow);

        // response type
        typedef Maybe #(Bit #(16)) RspType;

        interface SeqDetIfc;
        method Action request (ReqType req);
        method ActionValue #(RspType) response;
        interface Client #(MAddr, MData) mem;
        endinterface

endpackage