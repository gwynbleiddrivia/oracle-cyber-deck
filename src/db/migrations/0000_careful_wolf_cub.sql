CREATE TABLE "documents" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"content" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "edges" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"source_node_id" uuid NOT NULL,
	"target_node_id" uuid,
	"document_id" uuid,
	"relationship_type" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "nodes" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"type" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "edges" ADD CONSTRAINT "edges_source_node_id_nodes_id_fk" FOREIGN KEY ("source_node_id") REFERENCES "public"."nodes"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "edges" ADD CONSTRAINT "edges_target_node_id_nodes_id_fk" FOREIGN KEY ("target_node_id") REFERENCES "public"."nodes"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "edges" ADD CONSTRAINT "edges_document_id_documents_id_fk" FOREIGN KEY ("document_id") REFERENCES "public"."documents"("id") ON DELETE no action ON UPDATE no action;