# Things I Don't Like About C\#

- No Discriminated Unions
- No way of passing immutable references to classes no notion of ownership
  at all actually
- Trailing commas not allow in function calls,
- Can't add methods or constructors to enums without extensions
- Can't do "one::two::three::".Split("::") have to do string.Split("one::two::three::", "::")
