import { neon } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';
import * as schema from './schema';

const sql = neon(process.env.DATABASE_URL_POOLED!);

// This exported 'db' will be import anywhere in our app to query data
export const db = drizzle(sql, { schema });