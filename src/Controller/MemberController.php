<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MemberController extends AbstractController
{
    #[Route('/Member/Home/{id}', name: 'MemberHome')]
    public function member_home(int $id, EntityManagerInterface $entityManagerInterface): Response {

        $account = $entityManagerInterface->getRepository(User::class)->find($id);

        return $this->render('Member_Home.html.twig');
    }
}
