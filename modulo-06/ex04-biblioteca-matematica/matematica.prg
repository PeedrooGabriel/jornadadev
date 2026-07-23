FUNCTION FatorialNum(nNum)
    IF nNum <= 1
        RETURN 1
    ENDIF
RETURN nNum * FatorialN(nNum - 1)

FUNCTION EhPrimo(nNum)
    LOCAL nI
    IF nNum <= 1
        RETURN .F.
    ENDIF
    FOR nI := 2 TO INT(SQRT(nNum))
        IF nNum % nI == 0
            RETURN .F.
        ENDIF
    NEXT
RETURN .T.

FUNCTION MDC(nA, nB)
    LOCAL nResto
    WHILE nB != 0
        nResto := nA % nB
        nA := nB
        nB := nResto
    ENDDO
RETURN nA

FUNCTION MMC(nA, nB)
    IF nA == 0 .OR. nB == 0
        RETURN 0
    ENDIF
RETURN ABS(nA * nB) / MDC(nA, nB)