public class Ticket {

    private final String ticketId;
    private final int floorNumber;
    private final int slotNumber;

    private Ticket(String ticketId, int floorNumber, int slotNumber) {
        this.ticketId = ticketId;
        this.floorNumber = floorNumber;
        this.slotNumber = slotNumber;
    }

    public static Ticket generate(String parkingLotId, int floor, int slot) {
        String ticketId = parkingLotId + "_" + floor + "_" + slot;
        return new Ticket(ticketId, floor, slot);
    }

    public String getTicketId() {
        return ticketId;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public int getSlotNumber() {
        return slotNumber;
    }


    
}
