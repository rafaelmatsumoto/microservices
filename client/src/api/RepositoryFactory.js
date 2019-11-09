import MoviesRepository from './moviesRepository';

const repositories = {
  movies: MoviesRepository,
};

// eslint-disable-next-line import/prefer-default-export
export const RepositoryFactory = {
  get: name => repositories[name],
};
