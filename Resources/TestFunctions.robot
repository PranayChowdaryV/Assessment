*** Settings ***

Library    ../Function.py

*** Keywords ***

Check Boundary Values
    [Documentation]  This Keyword will validate the pre, post and given value of the Funtion
    [Arguments]    ${BoundaryNum}
    set suite variable    ${KeywordOutput}    ${EMPTY}
    IF  ${BoundaryNum}>100 or ${BoundaryNum}<-100 or ${BoundaryNum}==13
        ${Status}    run keyword and return status    run keyword and expect error    System error    output    ${BoundaryNum}
        IF  ${Status}
            set suite variable    ${KeywordOutput}    System error
        ELSE
            set suite variable    ${KeywordOutput}    Unexpected Error
        END
    ELSE
        ${Status}    run keyword and return status    output    ${BoundaryNum}
        IF  ${Status}
            ${KeywordOutput}    evaluate    10//${BoundaryNum}
        ELSE
            set suite variable    ${KeywordOutput}    System Error
        END
    END
    [Return]    ${KeywordOutput}