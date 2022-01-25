# Lines Format Manual 

The lines format is a shorthand syntax for defining data- and servicemodels in IMS specifications. It is intended to allow rapid prototyping & development of models for IMS specifications, all whilst being text-based and therefore (all things being relative) git workflow friendly. 

Files in this format can be read by the IMS Model Processing Service (MPS), enabling model validation, model review, as well as automated generation of artifacts including e.g. schemas and documentation. 

## Sideloading a lines file in the sandbox application

To load a lines file in the IMS model sandbox application, access the `/upload` path, either via your CI/CD integration pipeline, or via the upload web page also available at that path. Unless a beta build of the application is used, the full URL is `https://datamodels.imsglobal.org/upload`. If you are using CI/CD, the REST endpoint expects a POST method with a request param `file` which needs to be a multipartfile.

_Note: access to the sandbox application is restricted to IMS members. Your nearest IMS staff member can you help get the apikey needed for access._

If the file upload and subsequent parsing and validation of the model succeeds, you will be redirected to a view of the model you just uploaded. If it does not succeed, an error will be returned. Pay attention to the error message: it should contain information about what error occurred, and if applicable the location (file name and line number) where the cause of the error resides. 

A file uploaded this way will remain available until 10 days without access have passed (or the service is restarted). You will need to share the direct URL of the model with others, as the model by design will not appear in the app's model selector dropdown dialog. 

## Lines syntax: the basics

A .lines file consists of a sequence of definitions. Each definition, as the format name implies, occurs on one line. In other words, linebreaks are significant as they indicate that the previous definition has ended and a new one started. 

Each line consists of series of tokens, where each token has a special meaning depending on its occurrence order in the line. The first token is always the "type" token, and the second token the "name" token. 

The tokens are separated by whitespace. Tokens where whitespace is significant are always enclosed in double quotes, and occur in a group at the end of the line.  

Lines that begin with "//" are comment lines. 

In the syntax definitions below, a token ending with "!" indicates that it is required. A token ending with "?" is optional. 

## Lines syntax: DataModels

### The Model line

The `Model` line only occurs once in a model, and must be the first line (excluding any leading comment lines). The `Model` line must be followed by a `Package` line. 

Syntax: 
```
Model shortName! date! version! "s:status"! "t:title"! "r:authors"? "description"?
```

Example: 
```
Model caliper 2019-08-31 1.2 "s:IMS Base Document" "t:Caliper Analytics" "r:name,name" "Caliper is a..."
```

### The Package line

The `Package` line groups a set of `Class` lines. It must be followed by at least one `Class` line. 

Syntax: 
```
Package Name! Stereotype! "description"?
```
The `Name` token must be unique within the scope of all `Package` lines in the Model. 

The `Stereotype` token must be one of the following values: "DataModel", [TBD for ServiceModels, Roots etc]. If you omit this token, it will default to "DataModel".

Example: 
```
Package Survey DataModel
```

There must be at least one DataModel Package in a model. 

### The Class line

The `Class` line defines a type, and groups a set of zero, one or many `Property` lines. 

Syntax: 
```
Class Name! Stereotype! isAbstract! [SuperTypes] root? "description"?
```
The `Name` token must be unique within the scope of the classes in the model. 

The `Stereotype` token must be one of the following values: "TODO", "TODO".

The `isAbstract` token is a boolean, i.e. must be set to `false` or `true`.

The `SuperTypes` token takes a comma-separated list of names of other classes in this model that this class inherits from. 
It must be present even if there are no supertypes, in which case it is set to the empty array, i.e. "[]" (see example below).

The `root` token is optional and if present, signals that this class is eligible to be a top-level type in an API.  

Example (with supertype): 
```
Class AggregateMeasure Unordered false [Entity] root "The AggregateMeasure class is a..."
```

Example (without supertype): 
```
Class Entity Unordered true []
```

Example (enumeration):
```
Class MyEnum Enumeration false []
```

Example (extensible enumeration):
```
Class MyExtensibleEnum EnumExt false []
```

Example (union)
```
Class MyUnion Union false [MyClass, Entity]
```

### The Property line

The `Property` line defines a property of a class. It is the "leaf" node of the model tree. 

Syntax: 
```
Property name! type! cardinality! "v:defaultValue"? "description"?
```

The type token must be the name of another class in the model. 

The cardinality token must be one of the following values: `0..1`, `1`, `0..*`, `1..*` which corresponds to "zero or one", "exactly one", "zero or many" and "one or many".


Example: 
```
Property maxMetricValue Decimal 0..1
```

Example (with default value): 
```
Property type Term 1 "v:Attempt"
```

### The Classes line

As a shorthand, it is possible to define several classes on one line. The requirement is that they have the same Stereotype and inheritance, and the drawback is that the classes can not have description tokens. You should therefore primarily use this feature (if at all) during rapid prototyping stages.

Syntax: 
```
Classes [Names]! Stereotype! [SuperTypes]!
```

The Names token takes a comma separated list of Class names.

The Stereotype token has the same value restrictions as the Stereotype token of the Class line. 

The SuperTypes token takes a comma-separated list of names of other classes in this model that each class inherits from. 
It must be present even if there are no supertypes, in which case it is set to "[]". 


Example: 
```
Classes [String, PositiveInteger, Integer, AnyURI, Boolean, DateTime, Decimal] PrimitiveType []
```

### The Properties line

As a shorthand, it is possible to define several properties on one line. The requirement is that they have the same type and cardinality, and the drawback is that the properties can not have description tokens. You should therefore primarily use this feature (if at all) during rapid prototyping stages.

Syntax: 
```
Properties [Names]! Type! Cardinality!
```

The Names token takes a comma separated list of Property names.

The type token must be the name of a Class in this model. 

The Cardinality token has the same restrictions as the Cardinality token of the Property line. 


Example: 
```
Properties [ltiContextId, ltiDeploymentId, ltiToolId, ltiPlatformId] Term 1
```

### The Mixin line
_Note: Mixin lines are only used in conjunction with the Common Data Model (CDM)._

A `Mixin` is a CDM-specific construct that lets you insert a set of properties defined in the CDM into a Class in your local model. The prerequisute is that somewhere in the CDM, a Class with the Stereotype `Mixin` is defined; you can then refer to that mixin class via its name, and insert its contents (properties) in your class. 

A Mixin class can contain one or several properties.

Example (Mixin definition in CDM): 
```
Class Email Mixin true []										
    Property email EmailAddress 0..1	"An email address."
```

Example (Using a CDM Mixin in a local model): 
```
Class SomeClass …
    Property SomeProp …
    Mixin Email
    Property OtherProp …

```

You can modify the cardinality of a mixin locally by specifying the desired cardinality as a token following the name token. The prerequisite is that the Mixin in the CDM does contain multiple properties.

Example (Mixin with cardinality modification): 

```
Class SomeClass …
    Property SomeProp …
    Mixin Email 1
    Property OtherProp …
```

### The Includes, Include and Adapt lines
The Includes, Include and Adapt lines are only used when you want to reuse an element (Class or Mixin) from the Common Data Model (CDM).

Use the `Includes` line to include multiple CDM Classes in your local model without adapting (modifying) them on the way in. The `Includes` line must have an array token which contains the names of the CDM classes to include. 

Example (include two CDM classes unchanged): 
```
Package Education DataModel
	Includes [Address, TypedAddress]
```

If the CDM class you wish to reuse does not match your requirements exactly, you can adapt it using one or several available adaption methods. To achieve this, you would use the `Include` line (note: singular), followed by one or several `Adapt` lines.

At the time of writing, the available adaption methods are: 
* `cardinality`: change the cardinality of a single property. If the CDM-given property is optional you can also set the cardinality to `0` here, in which case it is removed. 
* `cardinalities`: change the cardinality of a set of properties (the name token is an array)
* `dataType`: change the data type of a single property (the new datatype must be a subclass of the CDM-given datatype)
* `stereoType`: change the stereotype of a single property (going from EnumExt to Enum is currently the only allowed change)
* `contour`: choose one of a set of class design options for a class in the CDM. The contour choice targets a class in the CDM which contains one or several design options as supertypes. Each supertype must have the `Choice` stereotype. 

Example (include one CDM class and adapt the cardinality of one of its properties): 
```
Package Education DataModel
	Include Address
		Adapt cardinality homeAddress 1
```

Example (include one CDM class and adapt the cardinality of multiple of its properties): 
```
Package Education DataModel
	Include Address
		Adapt cardinalities [homeAddress, visitingAddress] 1
```

Example (include one CDM class and adapt the datatype):
```
Package Education DataModel
	Include Contact
		Adapt dataType phoneNumber PhoneNumber
```

Example (include one CDM class and adapt the stereotype):
```
Package Education DataModel
	Include Contact
		Adapt stereoType phoneTypeEnum Enum
```

Example (include one CDM class and choose a contour):
```
Package Education DataModel
	Include Person
		Adapt contour Person Person_A
```

### The Transclude line
The Transclude line is used when you want to distribute a logical model among several physical files. 

The Transclude line, apart from its name, takes only one additional token, which is the relative path of the lines fragment to include. The contents of the fragment will be inserted at the spot where the given Transclude line occurs, effectively replacing it. 

_Note: At the time of writing, multi-file lines models is not supported in the sandbox application upload api._

Example: 
```
Transclude modules/myFragment.lines
```

## Lines syntax: ServiceModels

TBD

## Full example of a basic lines Model not using CDM

```
Model example 2020-01-24 1.0 "s:IMS Draft" "t:Example Specification" "r:First Last (Co), First Last (Co)" "Description..."

Package DataModel
	Class FirstClass Unordered false [] 				"Description..."
		Property prop1 String 0..1  					"Description..."

	Class SecondClass Unordered false [FirstClass] 		"Description..."
		Property prop2 IRI 1							"Description..."
		Property prop3 String 0..* 						"Description..."
	
Package PrimitiveTypes 
	Classes [String, Boolean, DateTime, AnyURI, Namespace] PrimitiveType []

Package DerivedTypes 	
	Classes [IRI, URL, URI] DerivedType [AnyURI]
```

## Full example of a basic lines Model using CDM for derived and primitive types
```
Model example2 2020-01-24 1.0 "s:IMS Draft" "t:Example2 Specification" "r:First Last (Co), First Last (Co)" "Description..."
Package DataModel
	Class FirstClass Unordered false [] 				"Description..."
		Property prop1 String 0..1  					"Description..."

	Class SecondClass Unordered false [FirstClass] 		"Description..."
		Property prop2 IRI 1							"Description..."
		Property prop3 String 0..* 						"Description..."
	
Package PrimitiveTypes 
	Includes [String, Boolean, DateTime, AnyURI, Namespace]

Package DerivedTypes 	
	Includes [IRI, URL, URI]
```
