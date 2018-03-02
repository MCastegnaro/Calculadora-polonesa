program expressaoSimples;

uses crt;

const
	max=100;

type
	TDado = real;
	TPilha = array[1..max] of TDado;

procedure push(var p:TPilha; var t:integer; dado:TDado);
begin
	if (t < max) then
		begin
			t := t + 1;
			p[t] := dado;
		end;
end;

function pop(var p:TPilha; var t:integer):TDado;
begin
	pop := 0;
	if (t > 0) then
		begin
			pop := p[t];
			t := t - 1;
		end;
end;

function calcula(x:real; y:real; operador:char):real;
begin
	case operador of
		'+' : calcula := x + y;
		'*' : calcula := x * y;
		'-' : calcula := x - y;
		'/' : calcula := x / y;
		else calcula := 0;
	end;
end;

function charToInteger(c:char):integer;
begin
	if (c in ['0'..'1']) then
		begin
			charToInteger := ord(c) - ord('0');
		end
	else
		begin
			charToInteger := 0;
		end;
	
end;

function calculaExpressaoSimples(exp:string):real;
var pilha:TPilha; 
    i,topo:integer;
	n1,n2,resultado:real;
begin
	topo := 0;
	for i:=1 to length(exp) do
	begin
		if ((exp[i] >= '0') and (exp[i] <= '9')) then
		//if (exp[i] in ['0'..'9']) then
			begin
				push(pilha,topo,charToInteger(exp[i]));
			end
		else
			begin
				n2 := pop(pilha,topo);
				n1 := pop(pilha,topo);
				push(pilha,topo,calcula(n1,n2,exp[i]));
			end;
	end;
	calculaExpressaoSimples := pop(pilha,topo);
end;

function calculaExpressaoComplexa(exp:string):real;
begin

end;

var expressao:string;

begin
	clrscr;
	writeln('Entre com uma expressao pos-fixada: ');
	readln(expressao);
	writeln('Resultado de ',exp,' = ',calculaExpressaoSimples(expressao):8:2);
	readkey;
end.
