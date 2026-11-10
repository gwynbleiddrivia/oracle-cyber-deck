There should be 3 tables
Documents, Nodes, Edges
The edges will be exponentially larger than the nodes. Like `n(n-1)/2` large.
Documents should have id(PK), created_at(Timestamp), content(Text)
Nodes should have id(PK), created_at(Timestamp), name(Text), type(It can be a person or an organization, Text)
Edges should have id(PK), source_node_id(FK->Nodes), target_node_id(FK->Nodes), document_id(FK->Documents), relationship_type(Text)
Nodes and Documents are independent. Edges ties them together.

This conceptual model has to be implemented using pure Typescript, by Drizzle ORM.