# ThriftFinder
ThriftFinder -  finds needed Realm classes from thrift text file
used by [[ThriftConvertor]](https://github.com/Maxatma/ThriftConvertor).

### Usage:

        // instantiate finder
        let finder = Finder()
        
        // find class names in thrift file
        let thriftClassesNames = finder.findAllClassNamesIn(text: thriftText)
        
        // find all enums
        let thriftEnumsNames = finder.findAllEnumsNamesIn(text: thriftText)
        
        // create [ThriftClass] array 
        // ThriftConvertor create Realm classes and mappers from it.
        let classes = finder.createTrfitClassesFrom(text: thriftText)


## Contacts

Oleksandr Zaporozhchenko
[[github]](https://github.com/Maxatma)  [[gmail]](mailto:maxatma.ids@gmail.com)  [[fb]](https://www.facebook.com/profile.php?id=100008291260780)  [[in]](https://www.linkedin.com/in/maxatma/)
