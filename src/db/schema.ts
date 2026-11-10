import { pgTable, text, timestamp, uuid } from 'drizzle-orm/pg-core'

export const documents = pgTable('documents',{
    id: uuid('id').primaryKey().defaultRandom(),
    content: text('content').notNull(),
    createdAt: timestamp('created_at').defaultNow().notNull()
});

export const nodes = pgTable('nodes',{
    id: uuid('id').primaryKey().defaultRandom(),
    name: text('name').notNull(),
    type: text('type').notNull(),
    createdAt: timestamp('created_at').defaultNow().notNull()
});

export const edges = pgTable('edges',{
    id: uuid('id').primaryKey().defaultRandom(),
    sourceNodeId : uuid('source_node_id').references(()=>nodes.id).notNull(),
    targetNodeId : uuid('target_node_id').references(()=>nodes.id),
    documentId : uuid('document_id').references(()=>documents.id),
    relationshipType: text('relationship_type').notNull()
})