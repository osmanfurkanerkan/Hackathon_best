import Nat32 "mo:base/Nat32";
import Trie "mo:base/Trie";
import Option "mo:base/Option";
import List "mo:base/List";
import Text "mo:base/Text";
import Result "mo:base/Result"
actor {
  
  public type superhero = {
    name:Text;
    superpowers :List.List<Text>;
  };

  public type superheroID = Nat32;
  
  private stable next:superheroID=0;


  private stable superheroes : Trie.Trie<Nat32,superhero>

  public func creathero (newhero: superhero) :async Nat32{
    let id = next;
    next+=1;
    superheroes = Trie.replace(
      superheroes,
      key(id),
      Nat32.equal,
      ?newhero
    ).0
    return id;
  };

  public func getHero (id : superheroID) : asynx ?SuperHero{
    let result = Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );
    return reslt;
  };

  public func updateHero (id:superheroID ,newhero :superhero) : async Nat32 {
    let result =Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );
    let exists =Option.isSome(result);
    if (exists){
      superheroes :=Trie.replace(
        superheroes,
        key(id),
        Nat32.equal,
        ?newhero
      )
    };
    public func delete (id:superheroID ,newhero :superhero) : async Nat32 {
    let result =Trie.find(
      superheroes,
      key(id),
      Nat32.equal
    );
    let exists =Option.isSome(result);
    if (exists){
      superheroes :=Trie.replace(
        superheroes,
        key(id),
        Nat32.equal,
        null
      ).0
    };
  };

  private func key(x:superheroID): Trie.key<superheroID>{
    { hash = x; key =X};
  };
};
};
