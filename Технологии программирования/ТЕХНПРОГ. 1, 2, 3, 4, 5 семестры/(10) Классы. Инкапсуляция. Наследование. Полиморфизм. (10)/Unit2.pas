unit Unit2;

interface

implementation

	uses
		SysUtils,
		Dialogs;

	type Resident = class
              apartament : Integer;
              Surrname : String;
              function Info (): String;
      end;
	function Resident.Info;
		begin
			Result := '������: ' + Surrname +'; ����� ��������: ' + IntToStr(apartament) + '';
		end;

	Var
		Ivanov : Resident;
	begin
		Ivanov := Resident.Create();
		Ivanov.apartament:=100;
		Ivanov.Surrname:='������ �. �.';
		Showmessage(Ivanov.Info());
	End.


end.
 