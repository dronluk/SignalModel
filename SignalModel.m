fd=100e6; % ������� �������������
td=1/fd; %������ ������������� 
fc=2e6; % ������� ������� (������� ��������� ������� carr(t) ),
T=0.01; %����� ������������� � ��������
Nms=T*1000; %���������� ����������� ������������� ( Nms = T*1000 ),
t=td:td:T; % �������� ���
N=1:length(t);
f_psp=fd/1023000;
sv=1;
n=0.2*sin(2*pi*fc*4*td*N);%���
carr=sin(2*pi*fc*td*N);%�������
psp = get_cacode(sv,f_psp);%���
figure(1);
plot(carr); hold on;xlim([1 500]);ylim([-2 2]);
plot(psp);
m=1;
for k=1:length(t)
    psp2(k)=psp(m);
    m=m+1;
    if m>length(psp)
        m=1;
    end
end
psp=psp2;
s=psp.*carr;
figure(2);
plot(s);xlim([1 500]);ylim([-2 2]);
hold on; plot(n,'r');