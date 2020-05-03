/// Detecta si el [value] es un numero
/// * `value` Valor a parsear a number
bool isNumeric(String value) {
  if (value.isEmpty) return false;
  return (num.tryParse(value) == null) ? false : true;
}

/// Detecta si el [value] es un Email
/// * `value` Texto a verificar
String checkEmail(String value) {
  if (RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value)) {
    return null;
  } else {
    return 'Correo inválido';
  }
}

/// Detecta si el [value] tiene una longitud mayor a 3
/// * `value` Texto a verificar
String checkPassword(String value) {
  return (value.length >= 3) ? null : 'Debe ser mayor a 3 caracteres';
}
