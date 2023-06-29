<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230629195002 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE attraction ADD user_id_id INT NOT NULL');
        $this->addSql('ALTER TABLE attraction ADD CONSTRAINT FK_D503E6B89D86650F FOREIGN KEY (user_id_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_D503E6B89D86650F ON attraction (user_id_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE attraction DROP FOREIGN KEY FK_D503E6B89D86650F');
        $this->addSql('DROP INDEX IDX_D503E6B89D86650F ON attraction');
        $this->addSql('ALTER TABLE attraction DROP user_id_id');
    }
}
