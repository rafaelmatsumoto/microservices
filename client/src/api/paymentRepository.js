import axios from 'axios';

const baseDomain = 'http://localhost:4000';
const baseURL = `${baseDomain}`;

export default axios.create({
  baseURL,
});
