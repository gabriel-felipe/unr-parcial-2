;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname parcial2-gabriel-chiminelli) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Nombre: Gabriel Felipe Chiminelli
; DNI: 95812713
; Fecha: 01/07/2021 9:41

; a) Definir una función l-algun-positivo que tome una lista de listas de numeros y devuelva una lista con las listas que tengan algún elemento positivo.
; Ejemplo: (l-algun-positivo (list (list 0 -2 -3) (list 5 -1))) == (list (list 5 -1))
; Ayuda: definir una función algun-positivo que tome una lista de números y devuelva #t en el caso que contenga algún número positivo.
; Debe utilizar map, foldr o filter en este ítem.

; tiene-positivo? List(Number) -> Boolean
; Verifica si la lista l tiene algun numero positivo y retorna un Boolean de acuerdo.
(define (tiene-positivo? l) (> (length (filter positive? l)) 0))
(check-expect (tiene-positivo? (list 0 1)) #t)
(check-expect (tiene-positivo? (list 0)) #f)
(check-expect (tiene-positivo? empty) #f)
(check-expect (tiene-positivo? (list -1 -2)) #f)


; l-algun-positivo: List(List (Number)) -> List(List (Number))
; toma una lista de listas de numeros y devuelva una lista con las listas que tengan algún elemento positivo.
(define (l-algun-positivo l) (filter tiene-positivo? l))
(check-expect (l-algun-positivo (list (list 0 -2 -3) (list 1 2 3))) (list (list 1 2 3)))
(check-expect (l-algun-positivo (list (list 0 -2 -3))) empty)
(check-expect (l-algun-positivo (list (list 0 -2 -3) (list 1 2 3) (list -3 -2 4))) (list (list 1 2 3) (list -3 -2 4)))

; ------------------------------------------
; ------------------------------------------
; ------------------------------------------

; b) Definir una función and-filter que tome una lista l y 2 predicados p1 y p2 y
; devuelva la lista formada por todos los elementos para los cuales se cumpla p1 y p2.

; and-filter: List(any) (any -> Boolean) (any -> Boolean) -> List(any)
; Recibe una lista l y dos predicados (p1 y p2) y retorna una lista
; filtrando todos los elementos de l que evaluen #t para ambos p1 y p2
(define (and-filter l p1 p2)
  (cond
    [(empty? l) l]
    [(and (p1 (first l)) (p2 (first l))) (cons (first l) (and-filter (rest l) p1 p2))]
    [else (and-filter (rest l) p1 p2)]))

(check-expect (and-filter (list 1 0 -2 -3 4) even? positive?) (list 4))
(check-expect (and-filter (list 1 0 -2 -3 -5 4) odd? negative?) (list -3 -5))