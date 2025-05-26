program WordEncryptor;
uses
  SysUtils;

type
  TCharReplacement = record
    Original: Char;
    Substitutes: string;
  end;

function EncryptWord(const word: string): string;
const
  CharReplacements: array[0..5] of TCharReplacement = (
    (Original: 'a'; Substitutes: '@4'),
    (Original: 'e'; Substitutes: '3!'),
    (Original: 'i'; Substitutes: '1|'),
    (Original: 'o'; Substitutes: '0*'),
    (Original: 's'; Substitutes: '$5'),
    (Original: 't'; Substitutes: '7+')
  );
var
  i, j, replaceIndex: integer;
  found: boolean;
  currentChar: char;
  encryptedWord: string;
begin
  encryptedWord := '';
  for i := 1 to Length(word) do
  begin
    currentChar := word[i];
    found := False;
    
    for j := 0 to High(CharReplacements) do
    begin
      if LowerCase(currentChar) = CharReplacements[j].Original then
      begin
        replaceIndex := Random(Length(CharReplacements[j].Substitutes)) + 1;
        encryptedWord := encryptedWord + CharReplacements[j].Substitutes[replaceIndex];
        found := True;
        Break;
      end;
    end;
    
    if not found then
      encryptedWord := encryptedWord + currentChar;
  end;
  EncryptWord := encryptedWord; 
end;

var
  userInput: string;
begin
  Randomize;
  
  Write('Enter word to encrypt: ');
  Readln(userInput);
  
  if userInput = '' then
  begin
    Writeln('No input provided!');
    Exit;
  end;
  
  Writeln('Encrypted result: ', EncryptWord(userInput));
  Writeln('Press Enter to exit...');
  Readln;
end.
