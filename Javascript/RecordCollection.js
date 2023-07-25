// Setup
var Collection = {
    2548: {
      albumTitle: 'Slippery When Wet',
      artist: 'Bon Jovi',
      tracks: ['Let It Rock', 'You Give Love a Bad Name']
    },
    2468: {
      albumTitle: '1999',
      artist: 'Prince',
      tracks: ['1999', 'Little Red Corvette']
    },
    1245: {
      artist: 'Robert Palmer',
      tracks: []
    },
    5439: {
      albumTitle: 'ABBA Gold'
    }
  };
  
  // Only change code below this line

  var collectionCopy = JSON.parse(JSON.stringify(Collection));  //creating copy of the object Collection


  function updateRecords(id, prop, value) {
    if(value === "")
    {
        delete Collection[id][prop];    //condition of deletion of property is the absence of value
    }

    else if(prop === "tracks")
    {
        Collection[id][prop] = Collection[id][prop] || [];  //Tracks becomes a new property with empty array, if initially not present
        Collection[id][prop].push(value);
    }

    else    //when value isn't blank, and the property isn't tracks, just update the property to the passed value
    {
        Collection[id][prop] = value;
    }


    return Collection;
  }
  
  updateRecords(2468 , "tracks" , "test");
  console.log(updateRecords(5439, 'artist', 'ABBA'));