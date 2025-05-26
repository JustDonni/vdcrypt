program DillCrypt;
uses
  SysUtils;

type
  TCharReplacement = record
    Original: Char;
    Substitutes: array[1..2] of Char;
  end;

function EncryptWord(const word: string): string;
const
  Replacements: array[1..7] of TCharReplacement = (
    (Original: 'a'; Substitutes: ('@', '4')),
    (Original: 'e'; Substitutes: ('3', '!')),
    (Original: 'i'; Substitutes: ('1', '|')),
    (Original: 'o'; Substitutes: ('0', '*')),
    (Original: 's'; Substitutes: ('$', '5')),
    (Original: 't'; Substitutes: ('7', '+')),
    (Original: 'f'; Substitutes: ('2', '$'))
  );
var
  i, j: Integer;
  c: Char;
  found: Boolean;
  encrypted: string;  
begin
  encrypted := '';
  for i := 1 to Length(word) do
  begin
    c := LowerCase(word[i]);
    found := False;
    
    for j := Low(Replacements) to High(Replacements) do
    begin
      if c = Replacements[j].Original then
      begin
        encrypted := encrypted + Replacements[j].Substitutes[Random(2) + 1];
        found := True;
        Break;
      end;
    end;
    
    if not found then
      encrypted := encrypted + word[i];
  end;
  EncryptWord := encrypted; 
end;

var
  input: string;
begin
  Randomize;
  Write('Enter word to encrypt: ');
  Readln(input);
  
  if input = '' then
  begin
    Writeln('Error: No input provided');
    Exit;
  end;
  
  Writeln('Encrypted: ', EncryptWord(input));
  Writeln('Press Enter to exit...');
  Readln;
end.
