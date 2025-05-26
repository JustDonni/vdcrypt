program PasswordGenerator;
uses
  SysUtils;

function GeneratePassword(passwordLength: integer): string;
const
  ValidChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&;\:*()';
var
  i: integer;
  password: string;
begin
  Randomize; 
  password := '';
  
  for i := 1 to passwordLength do
   password := password + ValidChars[Random(Length(ValidChars)) + 1];
   
  GeneratePassword := password; 
end;

var
  userLength: integer;
begin
  Write('Enter password length (8-64): ');
  Readln(userLength);

  if (userLength < 8) or (userLength > 64) then
  begin
    Writeln('Invalid length! Using default 12 characters.');
    userLength := 12;
  end;
  
  Writeln('Your password: ', GeneratePassword(userLength));
  Writeln('Press Enter to exit...');
  Readln;
end.

