import Repository from './paymentRepository';

const resource = '/charge';

export default {
  charge(payload) {
    return Repository.post(`${resource}`, payload);
  },
};
