package com.afiq.tclibrary.spring2.delivery.http;

import com.afiq.tclibrary.spring2.model.Book;
import com.afiq.tclibrary.spring2.model.Genre;
import com.afiq.tclibrary.spring2.repository.BookRepository;
import com.afiq.tclibrary.spring2.repository.GenreRepository;
import com.afiq.tclibrary.spring2.usecase.BookUsecase;
import com.afiq.tclibrary.spring2.usecase.GenreUsecase;
import com.afiq.tclibrary.spring2.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@org.springframework.stereotype.Controller
public class Controller {

    Logger logger = LoggerFactory.getLogger(Controller.class);

    @Autowired
    BookRepository bookRepository;

    @Autowired
    BookUsecase bookUsecase;

    @Autowired
    GenreUsecase genreUsecase;

    @GetMapping({"/", "hello"})
    public String hello(Model model,
                        @RequestParam(value="name", required = false, defaultValue = "world") String name) {
        model.addAttribute("name", name);
        return "hello";
    }

    @GetMapping({"genres"})
    public String genreList(Model model) throws Exception {

        List<Genre> llist = genreUsecase.findAllGenres();
        model.addAttribute("genres", llist);
        return "genre-list";
    }

    @GetMapping({"addgenre"})
    public String addGenreView(Model model) throws Exception {
        model.addAttribute("genre", new Genre());
        return "genre-add";
    }

    @PostMapping({"addgenrepost"})
    public RedirectView addGenre(@ModelAttribute("genre") Genre genre,
                                RedirectAttributes redirectAttributes) {
        final RedirectView redirectView = new RedirectView("/addgenre", true);
        int savedBook = genreUsecase.save(genre);
        redirectAttributes.addFlashAttribute("addGenreSuccess", true);
        return redirectView;
    }

    @GetMapping({"deletegenre"})
    public RedirectView deleteGenre(@RequestParam(value="id", required = true) Long id,
                                   RedirectAttributes redirectAttributes) {
        final RedirectView redirectView = new RedirectView("/genres", true);

        genreUsecase.deleteById(id);

        redirectAttributes.addFlashAttribute("deleteGenreSuccess", true);

        return redirectView;
    }

    @GetMapping({"list"})
    public String helloList(Model model) throws Exception {

        List<Book> llist = bookUsecase.findAllBooks();
        model.addAttribute("books", llist);
        return "book-list";
    }

    @GetMapping({"books"})
    public String bookList(Model model,
                           @RequestParam(value="offset", required = false, defaultValue = "0") int offset,
                           @RequestParam(value="limit", required = false, defaultValue = "2") int limit,
                           @RequestParam(value="currentPage", required = false, defaultValue = "0") int currentPage) throws Exception {

        int count = (int) bookUsecase.findAllBooks().stream().count();
        Pagination pagination = new Pagination(count,
                offset,
                limit,
                currentPage);

        logger.warn("=========================");
        logger.warn("total items" + count);
        logger.warn(pagination.getTotalPages() + "");
        logger.warn(pagination.getPageNumbers() + "");
        logger.warn(pagination.getCurrentPage() + "");
        logger.warn("=========================");

        List<Book> llist = bookUsecase.findAllBooksPagination(offset, limit);
        model.addAttribute("books", llist);
        model.addAttribute("pagination", pagination);
        return "book-list-pagination";
    }

    @GetMapping({"addbook"})
    public String addBookView(Model model) throws Exception {
        model.addAttribute("book", new Book());
        model.addAttribute("genres", genreUsecase.findAllGenres());
        return "book-add";
    }

    @PostMapping({"addbookpost"})
    public RedirectView addBook(@ModelAttribute("book") Book book,
                                RedirectAttributes redirectAttributes) {
        final RedirectView redirectView = new RedirectView("/addbook", true);
        logger.warn("=========================");
        logger.warn(book.getTitle());
        logger.warn(book.getDescription());
        logger.warn(book.getGenreId() + "");
        logger.warn("=========================");
        int savedBook = bookRepository.save(book);
        redirectAttributes.addFlashAttribute("addBookSuccess", true);
        return redirectView;
    }

    @GetMapping({"deletebook"})
    public RedirectView deleteBook(@RequestParam(value="id", required = true) Long id,
                                RedirectAttributes redirectAttributes) {
        final RedirectView redirectView = new RedirectView("/list", true);

        int savedBook = bookRepository.deleteById(id);

        redirectAttributes.addFlashAttribute("deleteBookSuccess", true);

        return redirectView;
    }

    @GetMapping("findall")
    public ResponseEntity<List<Book>> findALl() {
        try {
            List<Book> books = bookUsecase.findAllBooksPagination(2, 2);

            if (books.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }

            return new ResponseEntity<>(books, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
