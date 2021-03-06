program F03;
uses sysutils;
//Kamus Global

const
    nmax = 100;

type
    buku = record
        id_buku: longint;
        judul_buku : string;
        author: string;
        kategori: string;
        tahun_terbit : integer;
        jumlah_buku : integer;
    end;

var
    list : array [1..nmax] of buku;

//Prosedur output buku

procedure print_buku( var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

//Prosedur mengeluarkan alfabetis

{procedure quicksort (left, right : integer);
var 
    i, j : integer;
    tmp, pivot : string;
begin
    i := left;
    j := right;
    pivot := list_output[(left + right) shr 1].judul_buku; // div 2
    repeat
        while pivot[1] > list_output[i].judul_buku do i += 1;   
        while pivot[1] < list_output[j].judul_buku do j -= 1;   
        if i <= j then
            begin
            tmp := list_output[i].judul_buku;
            list_output[i].judul_buku := list_output[j].judul_buku;
            list_output[j].judul_buku := tmp;
            j -= 1;
            i += 1; 
            end;
    until i > j;
    if left < j then quicksort(left , j);
    if i < right then quicksort(i , right);
end;}

//Prosedurnya

procedure cari;
//Kamus Lokal
var
    i , result, i_out : integer;
    input, tmp, tmp2 : string;
    stop : boolean;
    list_output : array [1..nmax] of buku;
    tmp3 : buku;

begin
stop := false;
result := 0;
i_out := 1;

while not(stop) do
    begin
    write('Masukan kategori: ');
    readln(input);
    if  (input = 'sastra') or
        (input = 'sains') or
        (input = 'manga')  or
        (input = 'sejarah')  or
        (input = 'programming') then
        begin
        writeln('Hasil pencarian :');
        for i := 1 to nmax do 
            begin
            if list[i].kategori = input then
                begin
                list_output[i_out] := list[i];
                i_out += 1;
                result += 1;
                end;
        end;

    i_out -= 1;
    i := 1;
    
    if result > 1 then
        begin
        repeat
            begin
            tmp := list_output[i].judul_buku;
            tmp2 := list_output[i+1].judul_buku;
            if tmp > tmp2 then
                begin
                tmp3 := list_output[i];
                list_output[i] := list_output[i+1];
                list_output[i+1] := tmp3;
                i := 0;
                end;
            i += 1;
            end
        until i = i_out;
        end;

    if result = 0 then 
        begin
        writeln('Tidak ada buku dalam kategori ini.');
        stop := true;
        end
    else
        begin
        for i := 1 to i_out do print_buku(list_output[i]);
        stop := true;
        end;
    
    end
    else writeln('Kategori ', input, ' tidak valid.');
    end;

end;


//Tes Jalan

begin
with list[3] do
    begin
    id_buku := 98311;
    judul_buku := 'Javascript for babies';
    author := 'Sterling';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;

with list[5] do
    begin
    id_buku := 6573;
    judul_buku := 'Learning Java';
    author := 'Jonathan';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;

with list[1] do
    begin
    id_buku := 2516;
    judul_buku := 'Clean Code';
    author := 'Robert';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;
    
with list[4] do
    begin
    id_buku := 786727;
    judul_buku := 'Competitive Programming 3';
    author := 'Steven';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;

with list[2] do
    begin
    id_buku := 7546;
    judul_buku := 'aku';
    author := 'bukan';
    kategori := 'sastra';
    tahun_terbit := 2010;
    end;

with list[6] do
    begin
    id_buku := 754656;
    judul_buku := 'aku';
    author := 'bukan';
    kategori := 'manga';
    tahun_terbit := 2010;
    end;

with list[7] do
    begin
    id_buku := 7546;
    judul_buku := 'kamu';
    author := 'tidak';
    kategori := 'sastra';
    tahun_terbit := 2010;
    end;



cari;

end.
