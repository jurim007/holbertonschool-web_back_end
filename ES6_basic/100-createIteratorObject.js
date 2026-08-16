export default function createIteratorObject(report) {
  const employees = [];

  for (const department of Object.values(report.allEmployees)) {
    employees.push(...department);
  }

  return {
    [Symbol.iterator]: function () {
      let index = 0;

      return {
        next: function () {
          if (index < employees.length) {
            return {
              value: employees[index++],
              done: false,
            };
          }

          return {
            value: undefined,
            done: true,
          };
        },
      };
    },
  };
}
