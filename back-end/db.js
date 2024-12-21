const Pool = require('pg').Pool;
const bcrypt = require('bcryptjs');
const pool = new Pool({
  user: 'postgres',
  host: 'db',
  database: 'API',
  password: '12345678',
  port: 5432,
});
module.exports = pool;