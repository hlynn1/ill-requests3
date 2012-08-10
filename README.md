This is a home-grown database for tracking interlibrary loan requests made by customers of the Brown County Library in Green Bay, WI.

The requests themselves are handled by our regional library system, the Nicolet Federated Library System (NFLS), via OCLC FirstSearch Resource Sharing. Since NFLS also processes interlibrary loans for other public libraries in our system, Resource Sharing isn't a good way for us to track requests among our ten library locations, or to get useful statistics about the number and type of items we are borrowing from other libraries on behalf of our customers. This database replaces the paper-based request tracking system in place as of August 2012. Requests are still passed to NFLS for processing.

## Planned Functionality

### Phase 1
- New Request: basic request entry, checking against existing customers, adding an activity with a submitted status
- Receive Item: add due date, local itemID number for checkout 
- Return Item 
- View Requests: basic queries based on pre-defined parameters 
- Cancel Request

### Phase 2 
- New Request: pull bibliographic data from WorldCat via API; bookmarklet to launch new request from WorldCat 
- Receive Item: print customer label/bookstrap with barcodes for request/OCLC#, BCL itemID 
- View Requests: batch activity updates (closed, etc.) 
- Cancel Request: launch email notice of cancellation to customer

### Phase 3 
- New Request: send submitted requests to NFLS via batch or individual email; allow selector to divert requests to purchase review before being submitted; pull customer data from Symphony via API/Web Services

### Phase 4 
- Receive Item: use Symphony API to automate creating temporary item, placing and trapping hold 
- Return Item: use Symphony API to automate discard of BCL itemID
