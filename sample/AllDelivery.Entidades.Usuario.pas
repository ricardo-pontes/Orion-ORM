unit AllDelivery.Entidades.Usuario;

interface

uses
  AllDelivery.Utilitarios;

type
  TUsuario = class
  private
    FUtilitarios : iUtilitariosValidacoes;
    FID: integer;
    FNome: string;
    FSobreNome: string;
    FEmail: string;
    FSenha: string;
    FCelular: string;
  public
    constructor Create;

    property ID: integer read FID write FID;
    property Nome: string read FNome write FNome;
    property SobreNome: string read FSobreNome write FSobreNome;
    property Email: string read FEmail write FEmail;
    property Senha: string read FSenha write FSenha;
    property Celular: string read FCelular write FCelular;

    function isIDVazio : boolean;
    function isNomeVazio : boolean;
    function isSobrenomeVazio : boolean;
    function isEmailValido : boolean;
    function isSenhaValida : boolean;
    function isCelularValido : boolean;
  end;

const
  USUARIO_MENSAGEM_IS_ID_VAZIO = 'Para um novo cadastro, o ID tem que ser zero.';
  USUARIO_MENSAGEM_IS_NOME_VAZIO = '� obrigat�rio informar o nome.';
  USUARIO_MENSAGEM_IS_SOBRENOME_VAZIO = '� obrigat�rio informar o sobrenome.';
  USUARIO_MENSAGEM_IS_EMAIL_VALIDO = 'O email informado n�o � um email v�lido.';
  USUARIO_MENSAGEM_IS_SENHA_VALIDA = 'A senha informada n�o � uma senha v�lida.';
  USUARIO_MENSAGEM_IS_CELULAR_VALIDO = 'O celular informado n�o � um celular v�lido.';

implementation

uses
  System.SysUtils;

{ TUsuario }

constructor TUsuario.Create;
begin
  FUtilitarios := TUtilitariosValidacoes.New;
end;

function TUsuario.isCelularValido: boolean;
begin
  Result := FUtilitarios.IsCelularValido(FCelular);
end;

function TUsuario.isEmailValido: boolean;
begin
  Result := FUtilitarios.IsEmailValido(FEmail);
end;

function TUsuario.isIDVazio: boolean;
begin
  Result := FID = 0 ;
end;

function TUsuario.isNomeVazio: boolean;
begin
  Result := FNome.IsEmpty;
end;

function TUsuario.isSenhaValida: boolean;
begin
  Result := FUtilitarios.IsSenhaValida(FSenha);
end;

function TUsuario.isSobrenomeVazio: boolean;
begin
  Result := FSobreNome.IsEmpty;
end;

end.
