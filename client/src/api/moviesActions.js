import Repository from './moviesRepository';

const resource = '/movies';

export default {
  get() {
    return Repository.get(`${resource}`);
  },

  getMovie(movieId) {
    return Repository.get(`${resource}/${movieId}`);
  },

  createMovie(payload) {
    return Repository.post(`${resource}`, payload);
  },
};
