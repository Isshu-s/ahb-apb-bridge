`timescale 1ns/1ps

module tb;

reg Hclk;
reg Hresetn;

wire Hwrite;
wire Hreadyin;
wire Hreadyout;
wire [1:0] Htrans;
wire [31:0] Hwdata;
wire [31:0] Haddr;
wire [31:0] Hrdata;
wire [1:0] Hresp;

wire Penable;
wire Pwrite;
wire [2:0] Pselx;
wire [31:0] Paddr;
wire [31:0] Pwdata;
wire [31:0] Prdata;

AHB_Master master (
    .Hclk(Hclk),
    .Hresetn(Hresetn),
    .Hresp(Hresp),
    .Hrdata(Hrdata),
    .Hwrite(Hwrite),
    .Hreadyin(Hreadyin),
    .Hreadyout(Hreadyout),
    .Htrans(Htrans),
    .Hwdata(Hwdata),
    .Haddr(Haddr)
);

Bridge_Top bridge (
    .Hclk(Hclk),
    .Hresetn(Hresetn),
    .Hwrite(Hwrite),
    .Hreadyin(Hreadyin),
    .Hreadyout(Hreadyout),
    .Hwdata(Hwdata),
    .Haddr(Haddr),
    .Htrans(Htrans),
    .Prdata(Prdata),
    .Penable(Penable),
    .Pwrite(Pwrite),
    .Pselx(Pselx),
    .Paddr(Paddr),
    .Pwdata(Pwdata),
    .Hresp(Hresp),
    .Hrdata(Hrdata)
);

APB_Interface apb (
    .Pwrite(Pwrite),
    .Pselx(Pselx),
    .Penable(Penable),
    .Paddr(Paddr),
    .Pwdata(Pwdata),
    .Pwriteout(),
    .Pselxout(),
    .Penableout(),
    .Paddrout(),
    .Pwdataout(),
    .Prdata(Prdata)
);

initial begin
    Hclk = 0;
    forever #5 Hclk = ~Hclk;
end

initial begin
    Hresetn = 0;

    #20;
    Hresetn = 1;

    #20;
    master.single_write();

    #50;
    master.single_read();

    #100;
    $finish;
end

endmodule