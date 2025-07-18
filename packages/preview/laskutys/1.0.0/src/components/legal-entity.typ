/// Content block containing name and other information of a legal entity i.e. seller or purchaser
///
/// -> content
#let legal-entity(
  entity,
  title,
) = {
  assert(type(entity) == dictionary)
  assert("name" in entity)
  assert("address" in entity)

  (
    [*#title*],
    entity.name,
    entity.at("business-id", default: none),
    entity.address,
  )
    .filter(x => x != none)
    .join("\n")
}
