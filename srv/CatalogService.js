module.exports = cds.service.impl(async function () {

    ///get access of database table/entity
    const { EmployeeSet } = this.entities;

    this.before('UPDATE', EmployeeSet, (req) => {
        //here we write our code which we want to plug-in
        //just before the data is updated in employee table
        if (req.data.salaryAmount >= 100) {
            req.error(500, "dude, this is too much salary");
        }
    });

});