# go-graphql-hackernews

These are the fundamental steps of creating GraphQL API with Go and gqlgen library.

1. ```go mod init``` ile projeyi oluştur.
2. gqlgen paketini kur ```printf '// +build tools\npackage tools\nimport (_ "github.com/99designs/gqlgen"\n _ "github.com/99designs/gqlgen/graphql/introspection")' | gofmt > tools.go```
3. ```go run github.com/99designs/gqlgen init``` ile gqlgen'i initialize et
    - ```gqlgen.yml``` -- Config dosyası, generate edilen kodlar üzerinde ayarlama yapmak için kullanılır.
    - ```graph/generated/generated.go```-- GraphQL'in çalışmasını sağlayan kodlar. Otomatik generate edilir biz müdahale etmeyiz.
    - ```graph/model/models_gen.go``` -- Oluşturduğumuz schemalara göre otomatik generate edilen Go structları
    - ```graph/schema.graphqls``` -- GraphQL schemalarımızı oluşturacağımız dosya
    - ```graph/schema.resolvers.go``` -- Uygulamamızın logic kodlarını yazacağımız dosya. generated.go bu dosya içerisinde yazdığımız methodları kullanır.
    - ```server.go```-- Uygulamamızın otomatik generate edilen entry point dosyası. Uygulama bu dosya üzerinden ayağa kaldırılır.
4. Schemalarımızı oluşturduktan sonra ```go run github.com/99designs/gqlgen generate```kodu çalıştırılır.
    - Eğer burada ```validation failed: packages.Load```hatası alırsak ```graph/schema.resolvers.go```dosyasındaki ```CreateTodo``` ve ```Todos```fonksiyonlarını silip komutu tekrar çalıştırmalıyız. Bunlar starter template ile gelen fonksiyonlardır.
5. Queryleri schema.resolvers.go dosyası içinde yaz.
6. Mutationları da schema.resolvers.go dosyası içinde yaz.

### Örnekler

Örnek Query : 

```graphql
query {
    links{
        title
        address,
        user{
        name
    }
  }
}
```

Örnek Mutation : 

```graphql
mutation {
  createLink(input: {title: "new link", address:"http://address.org"}){
    title,
    user{
      name
    }
    address
  }
}
```

### Notlar

- ```name: String!``` -- buradaki ! işareti non nullable anlamına gelir. 
- ```[Link!]!``` -- hem array boş olamaz, hem de tüm Link elemanları dolu olmalı.