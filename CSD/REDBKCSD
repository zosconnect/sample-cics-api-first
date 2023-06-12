**********************************************************************
* Copyright IBM Corp. 2023
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* 
*     http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
***********************************************************************

DEFINE PROGRAM(RBKSETUP)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Setup the Redbook store TSQs)

DEFINE TRANSACTION(RBKS)      GROUP(REDBKAPI)       PROGRAM(RBKSETUP)
       DESCRIPTION(Initialise the Redbook store)
       TWASIZE(0)             PROFILE(DFHCICST)
                              STATUS(ENABLED)
       PRIORITY(1)            TASKDATALOC(ANY)       TASKDATAKEY(USER)
                                                     RESTART(NO)
       SPURGE(NO)             TPURGE(NO)             DUMP(YES)
       TRACE(YES)
       RESSEC(YES)

DEFINE PROGRAM(RBKTEARD)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Tear down the Redbook store TSQs)

DEFINE TRANSACTION(RBKT)      GROUP(REDBKAPI)       PROGRAM(RBKTEARD)
       DESCRIPTION(Tear down the Redbook store TSQs)
       TWASIZE(0)             PROFILE(DFHCICST)
                              STATUS(ENABLED)
       PRIORITY(1)            TASKDATALOC(ANY)       TASKDATAKEY(USER)
                                                     RESTART(NO)
       SPURGE(NO)             TPURGE(NO)             DUMP(YES)
       TRACE(YES)
       RESSEC(YES)

DEFINE PROGRAM(RBKZCAPI)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Main entry point to call the required operation)

DEFINE PROGRAM(RBKCRTOP)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Implement createRedbook operation)

DEFINE PROGRAM(RBKGAROP)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Implement getAllRedbooks operation)

DEFINE PROGRAM(RBKGETOP)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Implement getRedbook operation)

DEFINE PROGRAM(RBKRAUTH)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Find a book based on author name)

DEFINE PROGRAM(RBKRTITL)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Find a book based on title name)

DEFINE PROGRAM(RBKRALLB)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Get all the books in the store)

DEFINE PROGRAM(RBKWBOOK)        GROUP(REDBKAPI)
       LANGUAGE(COBOL)          RELOAD(NO)             EXECKEY(USER)
       RESIDENT(NO)             USAGE(NORMAL)          USELPACOPY(NO)
       STATUS(ENABLED)          CEDF(YES)              DATALOCATION(ANY)
       CONCURRENCY(THREADSAFE)
       DESCRIPTION(Write a book to the store)