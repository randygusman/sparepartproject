namespace sparepartproject.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdateDatabase : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.SPIModels", newName: "SPI_Model");
        }
        
        public override void Down()
        {
            RenameTable(name: "dbo.SPI_Model", newName: "SPIModels");
        }
    }
}
