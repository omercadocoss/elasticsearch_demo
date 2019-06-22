<?php

namespace App\Command;

use Elasticsearch\ClientBuilder;
use Faker\Factory;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class ProfileApocalypseImportCommand extends Command
{
    public const COMMAND_NAME = 'app:profile_apocalypse_import';
    /**
     * @var \Faker\Generator
     */
    private $faker;
    /**
     * @var \Elasticsearch\Client
     */
    private $esClient;

    /**
     * ProfileImportCommand constructor.
     */
    public function __construct()
    {
        // Para instancias creadas por Amazon, para accesarlas remotamente (si es que no se cambio algo del config)
        // se tiene que agregar el puerto 443
        // Nota: esta configuracion normalmente se pondria en el archivo .env, pero para no complicar el demo el url se pone aqui
        $esUrl = 'https://nombredetudomainenawselasticsearch:443';

        $this->esClient = ClientBuilder::create()
            ->setHosts(
                [
                    $esUrl,
                ]
            )
            ->build();

        $this->faker = Factory::create();

        parent::__construct();
    }

    /**
     * Configuration command
     *
     * @return void
     */
    protected function configure(): void
    {
        $this->setName(self::COMMAND_NAME)
            ->setDescription('Crea perfiles falsos y los manda a un indice de Elasticsearch')
            ->addArgument('amount', InputArgument::REQUIRED, 'Perfiles ha generar');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $amountToCreate = $input->getArgument('amount');

        $output->writeln('Profile Data Apocalypse ha empezado!');
        $output->writeln('Crearemos #' . $amountToCreate . ' perfiles falsos en Elasticsearch');


        for ($i = 0; $i <= $amountToCreate; $i++) {
            $id = $i + 1;
            $firstName = $this->faker->name;
            $lastName = $this->faker->lastName;
            $address = $this->faker->address;
            $countryCode = $this->faker->countryCode;
            $text = $this->faker->text;

            $output->writeln(
                'Creando usuario #: ' . $id . ' | ' . $firstName . ' | ' . $lastName
                . ' | ' . $countryCode . ' | que vive en ' . $address
            );

            $this->esClient->index(
                [
                    'index' => 'el_pueblo_sabio',
                    'type' => '_doc',
                    'id' => $i + 1,
                    'body' => [
                        'nombre' => $firstName,
                        'apellido' => $lastName,
                        'direccion' => $address,
                        'pais' => $countryCode,
                        'texto' => $text,
                    ],
                ]
            );
        }

        $output->writeln('Profile Data Apocalypse ha terminado!');
    }
}
