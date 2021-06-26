%menghapus dan memebersihkan layar command window
clc;clear;

%langkah 1
%menyiapkan data alternatif, atribut, dan bobot
opts = detectImportOptions('Real estate valuation data set.xlsx'); %mengambil file yang akan dipilih
opts.SelectedVariableNames = [3:5 8]; %memilih data pada kolom 3,4,5,8
data = readmatrix('Real estate valuation data set.xlsx', opts);

%variabel x untuk mengambil data baris ke-1 sampai ke-50 sebagai data rating kecocokan masing-masing alternatif
x=data(1:50,:); 
%variabel k adalah atribut tiap kriteria, nilai 1=atribut benefit, dan 0= atribut cost
k = [0,0,1,0];
%variabel w adalah bobot setiap kriteria
w = [3,5,4,1];

%langkah2
%perbaikan bobot
[m n]=size (x); %menginisialisasi ukuran x
w=w./sum(w); %melakukan normalisasi dengan membagi bobot per kriteria dengan jumlah total seluruh bobot

%langkah 3
%melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%langkah 4
%proses perangkingan
V = S/sum(S)
[poin number] = sort(V, 'descend'); %mengurutkan data
disp('DATA REAL ESTATE TERURUT')
disp(poin)
%mengambil data ranking 5 teratas menggunakan perulangan berdasarkan data terurut
disp('RANGKING REAL ESTATE 5 TERATAS')
disp(' ')
for z=1:5;
    dataurut = ['rangking ', num2str(z),' real estate adalah data no-', num2str(number(z)), ' dengan nilai Vektor V yaitu ',num2str(poin(z))];
    disp(dataurut)
end;


