<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Attraction;
use App\Form\AttractionType;
use App\Repository\AttractionRepository;
use Symfony\Component\HttpFoundation\Request;

class AdminController extends AbstractController {

    #[Route('/Admin/Home/{id}', name: 'AdminHome', methods: ['GET'])]
    public function admin_home(int $id, EntityManagerInterface $entityManagerInterface, AttractionRepository $attractionRepository): Response {

        $account = $entityManagerInterface->getRepository(User::class)->find($id);

        return $this->render('Admin_Home.html.twig', ['attractions' => $attractionRepository->findAll(), 'account' => $account]);
    }

    #[Route('/Admin/New', name: 'New', methods: ['GET', 'POST'])]
    public function new(Request $request, AttractionRepository $attractionRepository): Response
    {
        $attraction = new Attraction();
        $form = $this->createForm(AttractionType::class, $attraction);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $attractionRepository->save($attraction, true);

            return $this->redirectToRoute('app_attraction_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('Admin_New.html.twig', ['attraction' => $attraction, 'form' => $form]);
    }


    #[Route('Admin/Delete/{id}', name: 'Delete', methods: ['POST'])]
    public function delete(Request $request, Attraction $attraction, AttractionRepository $attractionRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$attraction->getId(), $request->request->get('_token'))) {
            $attractionRepository->remove($attraction, true);
        }

        return $this->redirectToRoute('Admin_Home.html.twig', [], Response::HTTP_SEE_OTHER);
    }
}
