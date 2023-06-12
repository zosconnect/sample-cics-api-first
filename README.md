# OpenAPI 3 API provider "API first" sample
A sample z/OS Connect API provider project showing how to generate a CICS API provider project from an OpenAPI 3.0 specification.

## Introduction
This Redbook API sample implements a very simple IBM Redbook information application written in COBOL and hosted in CICS. This application implements an OpenApi 3.0 described API found in the `src/main/api/openapi.yaml` file in both the `start` and `finish` sub directories.

The `start` directory contains an initial project layout which can be used as the basis for learning the process of creating an API first project using the z/OS Connect Gradle plugin. This initial layout was created by runining the `apiProviderLayout` task of the z/OS Connect Gradle plug-in.

The `finish` directory contains a completed API project which can be used to see all the parts and definitions of a generated API. The completed project was created by running the `generateApiProvider` and `build` tasks of the z/OS Connect Gradle plug-in.

## Instructions
1. Follow the instructions in the [IBM Documentation](https://www.ibm.com/docs/en/zos-connect/zos-connect/3.0?topic=provider-using-api-gradle-plug-in) on how to generate and build the API provider project. 

2. Then follow the instructions in the [IBM Documentation](https://www.ibm.com/docs/en/zos-connect/zos-connect/3.0?topic=overview-api-provider-devops) on how to deploy the API WAR file.

3. Finally compile and install the COBOL programs into your CICS region and run the `RBKS` transaction to intialise the Redbook store.

## Structure
* The `COBOL` directory contains the CICS COBOL programs that implement the IBM Redbook API. RBKZCAPI is the first program called by z/OS Connect.
* The `COPY` directory contains the COBOL copybooks required by the COBOL programs. The remaining copybooks are generated from the OpenAPI document and can be found in `finish/build/generated/zosConnectProvider/structures`.
* The `CSD` directory contains the CSD file to define the COBOL programs and transactions to CICS.
* The `start` directory contains an initial project layout which can be used as the basis for learning the process of creating an API first project using the z/OS Connect Gradle plugin
* The `finish` directory contains a completed API project which can be used to see all the parts and definitions of a generated API.

## RedbookAPI operations
### getAllRedbooks
Path **/redbooks**. Method **GET**. Passes an optional author query parameter of type string and expects an array of Redbook objects for a **200** response.

### getRedbook
Path **/redbook/{bookName}**. Method **GET**. Passes a title path parameter, and optional author query parameter and optional documentType header parameter. A Redbook object is returned for a **200** response. For a **404 (Not Found)** response a RedbookNotFound object is returned containing a message. A **500** for media type **text/plain** with a string schema.

### createRedbook
Path **/redbook/{bookName}**. Method **POST**. Passes a bookName path parameter and a Book object body. Expects a Book object for a **2XX** wildcarded response. A **409 (Conflict)** can also be returned. No other default responses are defined.

## License
See `LICENSE` for details.