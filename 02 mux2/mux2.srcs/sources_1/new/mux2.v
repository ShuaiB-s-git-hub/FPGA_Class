// ���������һ����ѡһ������ѡ����

 // Verilog�������ִ�Сд
module mux2(   // �����˿�
    a,b,
    sel,
    out
);
    input a,b,sel; //�����źŵķ���
    output out;
// ��sel����0��ʱ�� outΪa������Ϊb
// ������ʹ��assign���ʵ��
    assign out = (sel==0)?a:b;  // ��������Ͼ͸�C����һëһ��
    
endmodule